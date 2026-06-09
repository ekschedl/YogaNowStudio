//
//  ProfileInfoCard.swift
//  YogaNowStudio
//
//  Created by Kaaatkina on 09.06.26.
//
import SwiftUI

struct ProfileInfoCard: View {

    let title: String
    let value: String

    var body: some View {

        VStack(
            alignment: .leading,
            spacing: 6
        ) {

            Text(title.uppercased())
                .font(.caption)
                .fontWeight(.bold)
                .tracking(2)
                .foregroundColor(.yogaGold)

            Text(value)
                .fontWeight(.medium)
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

    ProfileInfoCard(
        title: "E-Mail",
        value: "katja@test.at"
    )
}
