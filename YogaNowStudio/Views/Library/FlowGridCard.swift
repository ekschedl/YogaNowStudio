//
//  FlowGridCard.swift
//  YogaNowStudio
//
//  Created by Kaaatkina on 04.06.26.
//
import SwiftUI

struct FlowGridCard: View {

    let video: Video
    var embedded: Bool = false
    @Environment(FavoritesStore.self) var favorites

    var leafCount: Int {
        switch video.level {
        case "Anfänger":        return 1
        case "Fortgeschritten": return 2
        case "Profi":           return 3
        default:                return 1
        }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Group {
                if let youtubeID = video.youtubeID {
                    AsyncImage(url: URL(string: "https://img.youtube.com/vi/\(youtubeID)/hqdefault.jpg")) { image in
                        image.resizable().scaledToFill()
                    } placeholder: {
                        Image(video.imageName).resizable().scaledToFill()
                    }
                } else {
                    Image(video.imageName).resizable().scaledToFill()
                }
            }
            .frame(height: 110)
            .clipped()
            .overlay(alignment: .topTrailing) {
                    Button {
                        favorites.toggle(video)
                    } label: {
                        Image(systemName: favorites.isFavorite(video) ? "heart.fill" : "heart")
                            .foregroundColor(favorites.isFavorite(video) ? .red : .white)
                            .font(.system(size: 14, weight: .semibold))
                            .padding(6)
                            .background(Color.black.opacity(0.3))
                            .clipShape(Circle())
                    }
                    .buttonStyle(.borderless)
                    .padding(6)
                }

            VStack(alignment: .leading, spacing: 6) {
                Text(video.title)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(.yogaGreen)
                    .lineLimit(1)

                Text(video.subtitle)
                    .font(.caption2)
                    .foregroundColor(.gray)
                    .lineLimit(2)

                HStack {
                    HStack(spacing: 2) {
                        ForEach(0..<leafCount, id: \.self) { _ in
                            Image(systemName: "leaf.fill")
                                .foregroundColor(.yogaGold)
                                .font(.caption2)
                        }
                    }
                    Spacer()
                    Label(video.duration, systemImage: "clock")
                        .font(.caption2)
                        .foregroundColor(.gray)
                }
            }
            .padding(10)
        }
        .background(Color.white.opacity(0.95))
        .cornerRadius(embedded ? 0 : 16)
        .shadow(color: embedded ? .clear : .black.opacity(0.07), radius: embedded ? 0 : 5)
    }
}
