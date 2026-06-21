//
//  LocalVideoPlayerView.swift
//  YogaNowStudio
//
import SwiftUI
import AVKit

struct LocalVideoPlayerView: View {
    let videoName: String

    private var player: AVPlayer? {
        guard let url = Bundle.main.url(forResource: videoName, withExtension: "mp4") else { return nil }
        return AVPlayer(url: url)
    }

    var body: some View {
        if let player {
            VideoPlayer(player: player)
        } else {
            Color.black
                .overlay {
                    Text("Video nicht gefunden")
                        .foregroundColor(.white)
                        .font(.caption)
                }
        }
    }
}
