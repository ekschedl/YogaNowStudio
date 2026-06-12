//
//  CourseCalendarCardView.swift
//  YogaNowStudio
//
//  Created by Kaaatkina on 12.06.26.
//

import SwiftUI

struct CourseCalendarCardView: View {

    // MARK: - Properties

    let imageName: String
    let title: String
    let time: String
    let participants: Int
    let isBooked: Bool

    // MARK: - Body

    var body: some View {

        HStack(spacing: 14) {

            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 140, height: 105)
                .clipShape(
                    RoundedRectangle(cornerRadius: 18)
                )

            VStack(alignment: .leading, spacing: 10) {

                HStack(alignment: .center, spacing: 8) {

                    Text(title)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.yogaGreen)
                        .lineLimit(1)

                    if isBooked {

                        Image(systemName: "checkmark.circle.fill")
                            .font(.title3)
                            .foregroundColor(.green)
                            .padding(6)
                            .background(
                                Color.green.opacity(0.12)
                            )
                            .clipShape(Circle())
                    }
                    Spacer()
                }

                Text(time)
                    .font(.title3)
                    .foregroundColor(.gray)

                HStack(spacing: 6) {

                    Image(systemName: "person.2.fill")
                        .foregroundColor(.gray)

                    Text("x \(participants)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }

            Image(systemName: "chevron.right")
                .font(.title3)
                .foregroundColor(.yogaGold)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(
            LinearGradient(
                colors: [
                    Color.white.opacity(0.92),
                    Color.yogaCream.opacity(0.72)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .clipShape(
            RoundedRectangle(cornerRadius: 26)
        )
    }
}

// MARK: - Preview

#Preview {

    CourseCalendarCardView(
        imageName: "ImageCourse01",
        title: "Morning Flow",
        time: "08:30 Uhr",
        participants: 12,
        isBooked: true
    )
    .padding()
    .background(Color.yogaCream)
}
