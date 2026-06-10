import SwiftUI

struct ParticipantDashboardView: View {

    var body: some View {

        ZStack {

            Image("BackgroundYoga")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            ScrollView(showsIndicators: false) {

                VStack {

                    Spacer()
                        .frame(height: 50)

                    // MARK: Header

                    VStack(spacing: 8) {

                        Text("Namasté")
                            .font(.title3)
                            .foregroundColor(.yogaGreen)

                        Text("Katja")
                            .font(
                                .system(
                                    size: 44,
                                    weight: .semibold,
                                    design: .serif
                                )
                            )
                            .tracking(2)
                            .foregroundColor(.yogaGold)
                        
                        Text("Schön, dass du heute da bist")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }

                    Spacer()
                        .frame(height: 70)

                    // MARK: Nächster Kurs
                    VStack(spacing: 18) {

                        Text("DEIN NÄCHSTER KURS")
                            .font(.caption)
                            .fontWeight(.bold)
                            .tracking(4)
                            .foregroundColor(.yogaGold)

                        Text("Morning Flow")
                            .font(
                                .system(
                                    size: 34,
                                    weight: .semibold,
                                    design: .serif
                                )
                            )
                            .foregroundColor(.yogaGreen)

                        Divider()
                            .padding(.horizontal)

                        HStack(spacing: 20) {

                            InfoCard(
                                title: "Zeit",
                                value: "18:00",
                                icon: "clock.fill"
                            )

                            InfoCard(
                                title: "Dauer",
                                value: "60 Min",
                                icon: "timer"
                            )
                        }

                        HStack(spacing: 20) {

                            InfoCard(
                                title: "Trainer",
                                value: "Laura",
                                icon: "person.fill"
                            )

                            InfoCard(
                                title: "Level",
                                value: "Alle",
                                icon: "figure.yoga"
                            )
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(24)
                    .background(
                        LinearGradient(
                            colors: [
                                Color.white.opacity(0.95),
                                Color.yogaCream.opacity(0.9)
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .clipShape(
                        RoundedRectangle(cornerRadius: 28)
                    )

                    // MARK: Kursdetails

                    NavigationLink {

                        CourseDetailView(
                            role: .participant,
                            imageName: "ImageCourse01",
                            title: "Morning Flow",
                            time: "18:00 - 19:00",
                            duration: "60 Min.",
                            level: "Alle Levels",
                            trainer: "Laura",
                            description: "Starte deinen Tag mit einer belebenden Yoga-Praxis für Körper und Geist.",
                            participants: 12,
                            maxParticipants: 15,
                            isBooked: false
                        )

                    } label: {

                        PrimaryButton(
                            title: "Kursdetails ansehen",
                            icon: "calendar"
                        )
                    }

                    Spacer()
                        .frame(height: 140)
                }
                .padding(.horizontal)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {

    NavigationStack {

        ParticipantDashboardView()

    }
    .environment(FavoritesStore())
}
