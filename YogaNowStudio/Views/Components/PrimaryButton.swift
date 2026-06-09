//
//  PrimaryButton..swift
//  YogaNowStudio
//
//  Created by Kaaatkina on 09.06.26.
//

import SwiftUI

struct PrimaryButton: View {

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
        .foregroundColor(.white)
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.yogaGreen)
        .clipShape(
            RoundedRectangle(
                cornerRadius: 18
            )
        )
    }
}

#Preview {

    PrimaryButton(
        title: "Kurs buchen",
        icon: "calendar.badge.plus"
    )
}
