//
//  VideoCard.swift
//  YogaNowStudio
//
//  Created by Kaaatkina on 02.06.26.
//
import SwiftUI

struct VideoCard: View {

    let title: String
    let level: String
    let duration: String

    var body: some View {

        HStack(spacing: 15) {

            RoundedRectangle(cornerRadius: 15)
                .fill(Color.yogaCream)
                .frame(width: 90, height: 70)
                .overlay(
                    Image(systemName: "play.circle.fill")
                        .font(.title)
                        .foregroundColor(.yogaGold)
                )

            VStack(alignment: .leading, spacing: 6) {

                Text(title)
                    .font(.headline)
                    .foregroundColor(.yogaGreen)

                HStack {

                    Label(level, systemImage: "leaf.fill")
                        .font(.caption)

                    Spacer()

                    Label(duration, systemImage: "clock")
                        .font(.caption)
                }
                .foregroundColor(.gray)
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
