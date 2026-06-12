//
//  BookingSuccessView.swift
//  YogaNowStudio
//
//  Created by Kaaatkina on 12.06.26.
//

import SwiftUI

struct BookingSuccessView: View {

    @Environment(\.dismiss) private var dismiss

    let course: Course

    var body: some View {

        ZStack {

            Image("BackgroundYoga")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack(spacing: 34) {

                Spacer()

                // MARK: Success Icon

                ZStack {

                    Circle()
                        .fill(Color.white.opacity(0.72))
                        .frame(width: 120, height: 120)

                    Circle()
                        .stroke(
                            Color.yogaGold.opacity(0.35),
                            lineWidth: 1
                        )
                        .frame(width: 120, height: 120)

                    Image(systemName: "checkmark")
                        .font(.system(size: 48, weight: .semibold))
                        .foregroundColor(.yogaGreen)
                }

                // MARK: Text

                VStack(spacing: 12) {

                    Text("Kurs gebucht")
                        .font(
                            .system(
                                size: 38,
                                weight: .semibold,
                                design: .serif
                            )
                        )
                        .foregroundColor(.yogaGreen)

                    Text("DEINE BUCHUNG WURDE BESTÄTIGT")
                        .font(.caption)
                        .fontWeight(.bold)
                        .tracking(4)
                        .foregroundColor(.yogaGold)

                    Text("Du hast den Kurs „\(course.title)“ erfolgreich gebucht.")
                        .font(.body)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .lineSpacing(4)
                        .padding(.horizontal, 20)
                }

                // MARK: Course Card

                VStack(alignment: .leading, spacing: 18) {

                    Text(course.title)
                        .font(
                            .system(
                                size: 28,
                                weight: .semibold,
                                design: .serif
                            )
                        )
                        .foregroundColor(.yogaGreen)

                    Divider()

                    HStack(spacing: 14) {

                        Image(systemName: "calendar")
                            .foregroundColor(.yogaGold)
                            .frame(width: 24)

                        VStack(alignment: .leading, spacing: 4) {

                            Text("TAG")
                                .font(.caption)
                                .fontWeight(.bold)
                                .tracking(3)
                                .foregroundColor(.yogaGold)

                            Text(course.day)
                                .fontWeight(.semibold)
                                .foregroundColor(.yogaGreen)
                        }

                        Spacer()
                    }

                    HStack(spacing: 14) {

                        Image(systemName: "clock.fill")
                            .foregroundColor(.yogaGold)
                            .frame(width: 24)

                        VStack(alignment: .leading, spacing: 4) {

                            Text("ZEIT")
                                .font(.caption)
                                .fontWeight(.bold)
                                .tracking(3)
                                .foregroundColor(.yogaGold)

                            Text(course.time)
                                .fontWeight(.semibold)
                                .foregroundColor(.yogaGreen)
                        }

                        Spacer()
                    }

                    HStack(spacing: 14) {

                        Image(systemName: "mappin.and.ellipse")
                            .foregroundColor(.yogaGold)
                            .frame(width: 24)

                        VStack(alignment: .leading, spacing: 4) {

                            Text("RAUM")
                                .font(.caption)
                                .fontWeight(.bold)
                                .tracking(3)
                                .foregroundColor(.yogaGold)

                            Text(course.room)
                                .fontWeight(.semibold)
                                .foregroundColor(.yogaGreen)
                        }

                        Spacer()
                    }
                }
                .padding(24)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    LinearGradient(
                        colors: [
                            Color.white.opacity(0.96),
                            Color.yogaCream.opacity(0.92)
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .clipShape(
                    RoundedRectangle(cornerRadius: 30)
                )
                .padding(.horizontal)

                // MARK: Button

                Button {

                    dismiss()

                } label: {

                    PrimaryButton(
                        title: "Zurück",
                        icon: "arrow.left"
                    )
                }
                .padding(.horizontal)

                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {

    NavigationStack {

        BookingSuccessView(
            course: Course(
                title: "Morning Flow",
                day: "Donnerstag",
                time: "08:30 Uhr",
                room: "Raum 1",
                participants: 12,
                imageName: "ImageCourse01"
            )
        )
    }
    .environment(FavoritesStore())
}
