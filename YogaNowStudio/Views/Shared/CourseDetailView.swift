import SwiftUI

struct CourseDetailView: View {

    let role: UserRole
    let imageName: String
    let title: String
    let time: String
    let duration: String
    let level: String
    let trainer: String
    let description: String
    let participants: Int
    let maxParticipants: Int
    let isBooked: Bool

    var body: some View {

        ScrollView {

            VStack(spacing: 0) {

                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 280)
                    .clipped()

                VStack(alignment: .leading, spacing: 15) {

                    Text(title)
                        .font(
                            .system(
                                size: 30,
                                weight: .semibold,
                                design: .serif
                            )
                        )
                        .foregroundColor(.yogaGreen)

                    HStack(spacing: 14) {

                        VStack(alignment: .leading, spacing: 6) {

                            Label(
                                "ZEIT",
                                systemImage: "clock.fill"
                            )
                            .font(.caption)
                            .fontWeight(.bold)
                            .tracking(2)
                            .foregroundColor(.yogaGold)

                            Text(time)
                                .fontWeight(.semibold)
                                .foregroundColor(.yogaGreen)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(Color.white.opacity(0.55))
                        .clipShape(
                            RoundedRectangle(cornerRadius: 18)
                        )

                        VStack(alignment: .leading, spacing: 6) {

                            Label(
                                "DAUER",
                                systemImage: "timer"
                            )
                            .font(.caption)
                            .fontWeight(.bold)
                            .tracking(2)
                            .foregroundColor(.yogaGold)

                            Text(duration)
                                .fontWeight(.semibold)
                                .foregroundColor(.yogaGreen)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(Color.white.opacity(0.55))
                        .clipShape(
                            RoundedRectangle(cornerRadius: 18)
                        )
                    }

                    HStack(spacing: 14) {

                        VStack(alignment: .leading, spacing: 6) {

                            Label(
                                "LEVEL",
                                systemImage: "figure.yoga"
                            )
                            .font(.caption)
                            .fontWeight(.bold)
                            .tracking(2)
                            .foregroundColor(.yogaGold)

                            Text(level)
                                .fontWeight(.semibold)
                                .foregroundColor(.yogaGreen)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(Color.white.opacity(0.55))
                        .clipShape(
                            RoundedRectangle(cornerRadius: 18)
                        )

                        VStack(alignment: .leading, spacing: 6) {

                            Label(
                                "TRAINER",
                                systemImage: "person.fill"
                            )
                            .font(.caption)
                            .fontWeight(.bold)
                            .tracking(2)
                            .foregroundColor(.yogaGold)

                            Text(trainer)
                                .fontWeight(.semibold)
                                .foregroundColor(.yogaGreen)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(Color.white.opacity(0.55))
                        .clipShape(
                            RoundedRectangle(cornerRadius: 18)
                        )
                    }

                    VStack(alignment: .leading, spacing: 10) {

                        Text("KURSBESCHREIBUNG")
                            .font(.caption)
                            .fontWeight(.bold)
                            .tracking(2)
                            .foregroundColor(.yogaGold)

                        Text(description)
                            .foregroundColor(.primary)
                            .lineSpacing(4)
                    }
                    .padding()
                    .background(Color.white.opacity(0.45))
                    .clipShape(
                        RoundedRectangle(cornerRadius: 20)
                    )
                    if role == .participant {
                        
                        VStack(alignment: .leading, spacing: 12) {

                            if isBooked {

                                Text("DEINE BUCHUNG")
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .tracking(2)
                                    .foregroundColor(.yogaGold)

                                Label(
                                    "Angemeldet",
                                    systemImage: "checkmark.circle.fill"
                                )
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundColor(.green)

                            } else {

                                Text("FREIE PLÄTZE")
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .tracking(2)
                                    .foregroundColor(.yogaGold)
                            }

                            Text(
                                "\(maxParticipants - participants) von \(maxParticipants)"
                            )
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.yogaGreen)
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.white.opacity(0.45))
                        .clipShape(
                            RoundedRectangle(cornerRadius: 20)
                        )

                        if isBooked {

                            SecondaryButton(
                                title: "Buchung stornieren",
                                icon: "xmark.circle"
                            )

                        } else {

                            PrimaryButton(
                                title: "Kurs buchen",
                                icon: "calendar.badge.plus"
                            )
                        }

                    } else {

                        VStack(alignment: .leading, spacing: 6) {

                            Text("TEILNEHMER")
                                .font(.caption)
                                .fontWeight(.bold)
                                .tracking(2)
                                .foregroundColor(.yogaGold)

                            Text("\(participants) Teilnehmer")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundColor(.yogaGreen)
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.white.opacity(0.45))
                        .clipShape(
                            RoundedRectangle(cornerRadius: 20)
                        )

                        NavigationLink {

                            ParticipantListView(
                                courseTitle: title
                            )

                        } label: {

                            PrimaryButton(
                                title: "Teilnehmer anzeigen",
                                icon: "person.2.fill"
                            )
                        }
                    }

                }
                .padding(40)
                .frame(
                    maxWidth: .infinity,
                    alignment: .topLeading
                )
                .background(
                    Color.yogaCream.opacity(0.96)
                )

                LinearGradient(
                    colors: [
                        Color.yogaCream.opacity(0.96),
                        Color.yogaCream.opacity(0.85),
                        Color.white.opacity(0.95),
                        Color.white
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .frame(height: 140)
            }
        }
        .ignoresSafeArea(edges: .top)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {

    NavigationStack {

        CourseDetailView(
            role: .participant,
            imageName: "ImageCourse01",
            title: "Morning Flow",
            time: "08:30 - 09:30",
            duration: "60 Min.",
            level: "Alle Levels",
            trainer: "Laura",
            description: "Starte deinen Tag mit einer belebenden Yoga-Praxis für Körper und Geist.",
            participants: 12,
            maxParticipants: 15,
            isBooked: true
        )
    }
    .environment(FavoritesStore())
}
