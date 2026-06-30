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

        ZStack {

            RoundedRectangle(cornerRadius: 26)
                .fill(Color.white)

            HStack(spacing: 14) {

                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 140, height: 105)
                    .clipped()
                    .clipShape(
                        RoundedRectangle(cornerRadius: 18)
                    )

                VStack(
                    alignment: .leading,
                    spacing: 10
                ) {

                    HStack(
                        alignment: .center,
                        spacing: 8
                    ) {

                        Text(title)
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color.yogaGreen)
                            .lineLimit(1)
                            .minimumScaleFactor(0.75)

                        if isBooked {

                            Image(
                                systemName: "checkmark.circle.fill"
                            )
                            .font(.title3)
                            .foregroundStyle(.green)
                            .padding(6)
                            .background(
                                Color.green.opacity(0.12)
                            )
                            .clipShape(Circle())
                        }

                        Spacer()
                    }

                    HStack(spacing: 6) {
                        Image(systemName: "clock.fill")
                            .font(.headline)
                        Text(time)
                            .font(.headline)
                    }
                    .foregroundStyle(Color.gray)

                    HStack(spacing: 6) {

                        Image(systemName: "person.2.fill")
                            .foregroundStyle(Color.gray)

                        Text("x \(participants)")
                            .font(.subheadline)
                            .foregroundStyle(Color.gray)
                    }
                }

                Spacer(minLength: 0)

                Image(systemName: "chevron.right")
                    .font(.title3)
                    .foregroundStyle(Color.yogaGold)
            }
            .padding()
        }
        .frame(maxWidth: .infinity)
        .clipShape(
            RoundedRectangle(cornerRadius: 26)
        )
        .contentShape(
            RoundedRectangle(cornerRadius: 26)
        )
        .shadow(
            color: Color.black.opacity(0.08),
            radius: 7,
            x: 0,
            y: 3
        )
    }
}

// MARK: - Preview

#Preview {

    CourseCalendarCardView(
        imageName: "ImageCourse01",
        title: "Morning Flow",
        time: "06:30 Uhr",
        participants: 1,
        isBooked: true
    )
    .padding()
    .background(Color.yogaCream)
}
