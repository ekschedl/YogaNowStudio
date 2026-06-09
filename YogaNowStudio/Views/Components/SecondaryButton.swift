//
//  SecondaryButton.swift
//  YogaNowStudio
//
//  Created by Kaaatkina on 09.06.26.
//

import SwiftUI

struct SecondaryButton: View {

    let title: String
    let icon: String?

    var body: some View {

        HStack {

            if let icon {
                Image(systemName: icon)
            }
            Text(title)
        }
        .fontWeight(.semibold)
        .foregroundColor(.red)
        .frame(maxWidth: .infinity)
        .padding()
        .background(
            Color.white.opacity(0.85)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 18)
                .stroke(
                    Color.red.opacity(0.2),
                    lineWidth: 1
                )
        )
        .clipShape(
            RoundedRectangle(
                cornerRadius: 18
            )
        )
    }
}

#Preview {
    SecondaryButton(
        title: "Abmelden",
        icon: "rectangle.portrait.and.arrow.right"
    )
}
