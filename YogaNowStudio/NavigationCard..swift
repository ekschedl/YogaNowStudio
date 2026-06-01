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

            Image(iconName)
                .resizable()
                .scaledToFit()
                .frame(width:100, height: 100)

            Text(title)
                .font(.title3)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding()
        .frame(height: 85)
        .background(.white.opacity(0.92))
        .cornerRadius(20)
        .shadow(radius: 5)
        .padding(.horizontal)
    }
}
