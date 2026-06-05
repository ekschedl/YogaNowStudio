//
//  VideoCard.swift
//  YogaNowStudio
//
//  Created by Kaaatkina on 02.06.26.
//
//
//  VideoCard.swift
//  YogaNowStudio
//
//  Created by Kaaatkina on 02.06.26.


import SwiftUI

struct VideoCard: View {

    let video: Video

    var leafCount: Int {

        switch video.level {

        case "Anfänger":
            return 1

        case "Fortgeschritten":
            return 2

        case "Profi":
            return 3

        default:
            return 1
        }
    }

    var body: some View {

        HStack(spacing: 0) {

            Image(video.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 140, height: 110)
                .clipped()

            VStack(alignment: .leading, spacing: 8) {

                Text(video.title)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.yogaGreen)

                Text(video.subtitle)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .lineLimit(2)

                Spacer()

                HStack {

                    HStack(spacing: 2) {

                        ForEach(0..<leafCount, id: \.self) { _ in

                            Image(systemName: "leaf.fill")
                                .foregroundColor(.yogaGold)
                                .font(.caption2)
                        }
                    }

                    Spacer()

                    Label(
                        video.duration,
                        systemImage: "clock"
                    )
                    .font(.caption)
                    .foregroundColor(.gray)
                }
            }
            .padding()
        }
        .frame(height: 110)
        .background(.white.opacity(0.95))
        .cornerRadius(20)
        .shadow(
            color: .black.opacity(0.05),
            radius: 5
        )
        .padding(.horizontal)
    }
}
