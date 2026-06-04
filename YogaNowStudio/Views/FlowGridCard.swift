//
//  FlowGridCard.swift
//  YogaNowStudio
//
//  Created by Kaaatkina on 04.06.26.
//
import SwiftUI

struct FlowGridCard: View {

    let video: Video

    var leafCount: Int {
        switch video.level {
        case "Anfänger":       return 1
        case "Fortgeschritten": return 2
        case "Profi":           return 3
        default:                return 1
        }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image(video.imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 110)
                .clipped()

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
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.07), radius: 5)
    }
}
