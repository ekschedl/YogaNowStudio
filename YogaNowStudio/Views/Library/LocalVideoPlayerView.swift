//
//  LocalVideoPlayerView.swift
//  YogaNowStudio
//
import SwiftUI
import AVKit

struct LocalVideoPlayerView: View {
    let videoName: String
    var overlayText: String? = nil
    var overlayAtBottom: Bool = false

    @State private var isPlaying = false
    @State private var player: AVPlayer? = nil

    var body: some View {
        ZStack {
            if isPlaying, let player {
                VideoPlayer(player: player)
            } else {
                LocalVideoThumbnailView(
                    videoName: videoName,
                    fallbackImage: "BackgroundYoga",
                    overlayText: overlayText,
                    overlayAtBottom: overlayAtBottom,
                    overlayFontSize: 28
                )

                Button {
                    startPlaying()
                } label: {
                    Image(systemName: "play.circle.fill")
                        .font(.system(size: 60))
                        .foregroundColor(.white.opacity(0.9))
                        .shadow(color: .black.opacity(0.3), radius: 6)
                }
            }
        }
    }

    private func startPlaying() {
        guard let url = Bundle.main.url(forResource: videoName, withExtension: "mp4") else { return }
        let p = AVPlayer(url: url)
        player = p
        isPlaying = true
        p.play()
    }
}
