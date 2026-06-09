//
//  InfoCard.swift
//  YogaNowStudio
//
//  Created by Kaaatkina on 09.06.26.
//

import SwiftUI

struct InfoCard: View {

    let title: String
    let value: String
    let icon: String

    var body: some View {

        VStack(
            alignment: .leading,
            spacing: 8
        ) {

            Label(
                title.uppercased(),
                systemImage: icon
            )
            .font(.caption)
            .fontWeight(.bold)
            .tracking(2)
            .foregroundColor(.yogaGold)

            Text(value)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.yogaGreen)
        }
        .frame(
            maxWidth: .infinity,
            alignment: .leading
        )
        .padding()
        .background(
            Color.white.opacity(0.6)
        )
        .clipShape(
            RoundedRectangle(
                cornerRadius: 18
            )
        )
    }
}

#Preview {

    InfoCard(
        title: "Credits",
        value: "8",
        icon: "star.fill"
    )
}
