import SwiftUI

struct TrainerDashboardView: View {

    // MARK: - Environment

    @EnvironmentObject private var sessionStore: SessionStore

    // MARK: - User Information

    private var userName: String {
        sessionStore.profile?.displayName ?? "Trainerin"
    }

    // MARK: - Body

    var body: some View {

        ZStack(alignment: .bottom) {

            Image("BackgroundYoga")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            ScrollView(showsIndicators: false) {

                VStack {

                    // MARK: - Header

                    VStack(spacing: 4) {

                        Text("Namasté")
                            .font(.subheadline)
                            .foregroundColor(.yogaGreen)

                        Text(userName)
                            .font(
                                .system(
                                    size: 36,
                                    weight: .semibold,
                                    design: .serif
                                )
                            )
                            .tracking(2)
                            .foregroundColor(.yogaGold)
                            .multilineTextAlignment(.center)
                            .lineLimit(2)
                            .minimumScaleFactor(0.7)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.top, 80)

                    // MARK: - Course Plan

                    VStack(spacing: 10) {

                        VStack(
                            alignment: .leading,
                            spacing: 8
                        ) {

                            HStack(alignment: .center) {

                                Text("HEUTE")
                                    .font(.caption2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.yogaGold)
                                    .tracking(4)

                                Spacer()

                                Text("3 Kurse • 26 Teilnehmer")
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                            }

                            Rectangle()
                                .fill(Color.yogaGold.opacity(0.3))
                                .frame(width: 70, height: 1)

                            Text("Dein Kursplan")
                                .font(
                                    .system(
                                        size: 28,
                                        weight: .medium,
                                        design: .serif
                                    )
                                )
                                .tracking(0.5)
                                .foregroundColor(.yogaGreen)
                        }
                        .frame(
                            maxWidth: .infinity,
                            alignment: .leading
                        )
                        .padding(.horizontal)
                        .padding(.top, 20)

                        // MARK: - Morning Flow

                        NavigationLink {

                            CourseDetailView(
                                role: .trainer,
                                imageName: "ImageCourse01",
                                title: "Morning Flow",
                                time: "08:30 - 09:30",
                                duration: "60 Min.",
                                level: "Alle Levels",
                                trainer: "Laura",
                                description:
                                    "Starte deinen Tag mit einer belebenden Yoga-Praxis für Körper und Geist.",
                                participants: 12,
                                maxParticipants: 15,
                                isBooked: true
                            )

                        } label: {

                            CourseCardView(
                                imageName: "ImageCourse01",
                                title: "Morning Flow",
                                time: "08:30 Uhr",
                                participants: 12
                            )
                        }
                        .buttonStyle(.plain)

                        // MARK: - Yin Yoga

                        NavigationLink {

                            CourseDetailView(
                                role: .trainer,
                                imageName: "ImageCourse02",
                                title: "Yin Yoga",
                                time: "17:30 - 18:30",
                                duration: "60 Min.",
                                level: "Anfänger",
                                trainer: "Sarah",
                                description:
                                    "Sanfte Yoga-Einheit für Entspannung und Beweglichkeit.",
                                participants: 6,
                                maxParticipants: 12,
                                isBooked: true
                            )

                        } label: {

                            CourseCardView(
                                imageName: "ImageCourse02",
                                title: "Yin Yoga",
                                time: "17:30 Uhr",
                                participants: 6
                            )
                        }
                        .buttonStyle(.plain)

                        // MARK: - Deep Balance

                        NavigationLink {

                            CourseDetailView(
                                role: .trainer,
                                imageName: "ImageCourse03",
                                title: "Deep Balance",
                                time: "19:00 - 20:00",
                                duration: "60 Min.",
                                level: "Fortgeschritten",
                                trainer: "Emma",
                                description:
                                    "Balance, Kraft und Fokus für Körper und Geist.",
                                participants: 8,
                                maxParticipants: 12,
                                isBooked: true
                            )

                        } label: {

                            CourseCardView(
                                imageName: "ImageCourse03",
                                title: "Deep Balance",
                                time: "19:00 Uhr",
                                participants: 8
                            )
                        }
                        .buttonStyle(.plain)
                    }
                    .padding(24)

                    Spacer()
                        .frame(height: 100)
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Preview

#Preview {

    NavigationStack {
        TrainerDashboardView()
    }
    .environmentObject(SessionStore())
    .environment(FavoritesStore())
}
