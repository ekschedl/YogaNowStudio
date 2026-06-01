//
//  NavigationCard..swift
//  YogaNowStudio
//
//  Created by Kaaatkina on 01.06.26.
//
import SwiftUI

struct NavigationCard: View {

    let title: String
    let iconName: String

    var body: some View {

        HStack(spacing: 15) {

            ZStack {

                Circle()
                    .fill(Color.yogaCream.opacity(0.9))
                      .frame(width: 72, height: 72)

                Image(iconName)
                    .resizable()
                     .scaledToFit()
                     .frame(width: 30, height: 30)
                     .scaleEffect(4)
            }

            Text(title)
                .font(.title3)
                .foregroundColor(
                    title == "Yoga Library"
                    ? .yogaGreen
                    : .yogaGold
                )

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundColor(
                    title == "Yoga Library"
                    ? .yogaGreen
                    : .yogaGold
                )
        }
        .padding()
        .frame(height: 90)
        .background(.white.opacity(0.92))
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.08), radius: 8)
        .padding(.horizontal)
    }
}
