//
//  YouTubePlayerView.swift
//  YogaNowStudio
//
import SwiftUI
import WebKit

struct YouTubePlayerView: UIViewRepresentable {
    let videoID: String

    func makeUIView(context: Context) -> WKWebView {
        let config = WKWebViewConfiguration()
        config.allowsInlineMediaPlayback = true
        config.mediaTypesRequiringUserActionForPlayback = []
        let webView = WKWebView(frame: .zero, configuration: config)
        webView.scrollView.isScrollEnabled = false
        webView.backgroundColor = .black
        webView.isOpaque = true
        return webView
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        let embedHTML = """
        <!DOCTYPE html>
        <html>
        <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style>
          * { margin: 0; padding: 0; background: black; }
          iframe { width: 100%; height: 100vh; border: none; }
        </style>
        </head>
        <body>
        <iframe src="https://www.youtube.com/embed/\(videoID)?playsinline=1&rel=0"
                allow="autoplay; encrypted-media"
                allowfullscreen>
        </iframe>
        </body>
        </html>
        """
        webView.loadHTMLString(embedHTML, baseURL: URL(string: "https://www.youtube.com"))
    }
}
