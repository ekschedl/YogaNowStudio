//
//  LocalVideoThumbnailView.swift
//  YogaNowStudio
//
import SwiftUI
import AVFoundation

struct LocalVideoThumbnailView: View {
    let videoName: String
    let fallbackImage: String
    var overlayText: String? = nil
    var overlayAtBottom: Bool = false

    @State private var thumbnail: UIImage? = nil

    var body: some View {
        Color.clear
            .background {
                Group {
                    if let thumbnail {
                        Image(uiImage: thumbnail)
                            .resizable()
                            .scaledToFill()
                    } else {
                        Image(fallbackImage)
                            .resizable()
                            .scaledToFill()
                    }
                }
                .clipped()
            }
        .overlay(alignment: overlayAtBottom ? .bottomLeading : .topLeading) {
            if let text = overlayText {
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(text.components(separatedBy: "\n"), id: \.self) { line in
                        Text(line.uppercased())
                            .font(.custom("Palatino-Bold", size: 14))
                            .foregroundColor(.white)
                            .padding(.horizontal, 5)
                            .padding(.vertical, 2)
                            .background(Color.black.opacity(0.55))
                    }
                }
                .padding(.leading, 22)
                .padding(overlayAtBottom ? .bottom : .top, 8)
            }
        }
        .task {
            thumbnail = await generateThumbnail()
        }
    }

    private func generateThumbnail() async -> UIImage? {
        guard let url = Bundle.main.url(forResource: videoName, withExtension: "mp4") else { return nil }
        let asset = AVAsset(url: url)
        let generator = AVAssetImageGenerator(asset: asset)
        generator.appliesPreferredTrackTransform = true
        generator.maximumSize = CGSize(width: 400, height: 300)
        let time = CMTime(seconds: 1, preferredTimescale: 600)
        guard let cgImage = try? await generator.image(at: time).image else { return nil }
        return UIImage(cgImage: cgImage)
    }
}
