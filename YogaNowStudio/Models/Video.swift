//
//  Video.swift
//  YogaNowStudio
//
//  Created by Kaaatkina on 02.06.26.
//
import Foundation

struct Video: Identifiable {

    let id: UUID
    let title: String
    let subtitle: String
    let level: String
    let duration: String
    let imageName: String
    let youtubeID: String?
    let youtubeEnd: Int?
    let localVideoName: String?
    let localVideoOverlay: String?
    let localVideoOverlayBottom: Bool
    let highlights: [String]?

    init(id: UUID, title: String, subtitle: String, level: String, duration: String, imageName: String, youtubeID: String? = nil, youtubeEnd: Int? = nil, localVideoName: String? = nil, localVideoOverlay: String? = nil, localVideoOverlayBottom: Bool = false, highlights: [String]? = nil) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.level = level
        self.duration = duration
        self.imageName = imageName
        self.youtubeID = youtubeID
        self.youtubeEnd = youtubeEnd
        self.localVideoName = localVideoName
        self.localVideoOverlay = localVideoOverlay
        self.localVideoOverlayBottom = localVideoOverlayBottom
        self.highlights = highlights
    }
}
