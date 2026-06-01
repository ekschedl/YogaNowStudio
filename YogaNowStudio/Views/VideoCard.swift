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

            Rectangle()
                .fill(Color.white.opacity(0.7))
                .frame(width: 90, height: 70)
                .cornerRadius(12)

            VStack(alignment: .leading, spacing: 5) {

                Text(title)
                    .font(.headline)

                Text(level)
                    .font(.caption)
                    .foregroundColor(.secondary)

                Text(duration)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            Spacer()
        }
        .padding()
        .background(.white.opacity(0.9))
        .cornerRadius(20)
        .padding(.horizontal)
    }
}
