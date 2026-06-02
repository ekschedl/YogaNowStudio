//
//  VideoCard.swift
//  YogaNowStudio
//
//  Created by Kaaatkina on 02.06.26.
//
import SwiftUI

struct VideoCard: View {

    let video: Video

    var body: some View {

        HStack(spacing: 12) {

            Image(video.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 120, height: 90)
                .clipped()
                .cornerRadius(12)

            VStack(alignment: .leading, spacing: 6) {

                Text(video.title)
                    .font(.headline)
                    .foregroundColor(.yogaGreen)

                Text(video.subtitle)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .lineLimit(2)

                HStack {

                    Label(video.level,
                          systemImage: "chart.bar.fill")
                        .font(.caption)
                        .foregroundColor(.yogaGold)

                    Spacer()

                    Label(video.duration,
                          systemImage: "clock")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }

            Spacer()
        }
        .padding()
        .background(.white.opacity(0.92))
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.05), radius: 5)
        .padding(.horizontal)
    }
}
