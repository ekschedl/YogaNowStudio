import SwiftUI

struct ParticipantDashboardView: View {
    let onShowBookings: () -> Void
    @EnvironmentObject private var bookingStore: BookingStore

    private var hasBooking: Bool {
        !bookingStore.bookings.isEmpty
    }

    private var displayedCourse: Course {
        bookingStore.bookings.first?.course ??
        Course(
            title: "Morning Flow",
            day: "Donnerstag",
            time: "18:00",
            room: "Raum 1",
            participants: 12,
            imageName: "ImageCourse01"
        )
    }

    private var sectionTitle: String {
        hasBooking ? "DEIN NÄCHSTER KURS" : "EMPFOHLENER KURS"
    }

    private var infoText: String {
        hasBooking
        ? "Du bist für diesen Kurs angemeldet."
        : "Du hast aktuell noch keine Buchung.\nDieser Kurs könnte gut zu dir passen."
    }
    
    private var buttonTitle: String {
        hasBooking ? "Buchung ansehen" : "Kursdetails ansehen"
    }

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

                    VStack(spacing: 10) {
                        Spacer()
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

                        
                        Text("Schön, dass du da bist")
                            .font(.subheadline)
                            .foregroundColor(.yogaGold)
                    }

                    Spacer()
                        .frame(height: 50)
                    
                    Text(infoText)
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)

                    // MARK: Kurs Card

                    VStack(spacing: 18) {

                        Text(sectionTitle)
                            .font(.caption)
                            .fontWeight(.bold)
                            .tracking(4)
                            .foregroundColor(.yogaGold)

                        HStack(alignment: .firstTextBaseline, spacing: 10) {

                            Text(displayedCourse.title)
                                .font(
                                    .system(
                                        size: 34,
                                        weight: .semibold,
                                        design: .serif
                                    )
                                )
                                .foregroundColor(.yogaGreen)

                            if hasBooking {

                                Label(
                                    "Angemeldet",
                                    systemImage: "checkmark.circle.fill"
                                )
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(.green)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 6)
                                .background(
                                    Color.green.opacity(0.10)
                                )
                                .clipShape(
                                    Capsule()
                                )
                            }
                        }

                        Divider()
                            .padding(.horizontal)

                        HStack(spacing: 20) {

                            InfoCard(
                                title: "Zeit",
                                value: displayedCourse.time,
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

                        if hasBooking {

                            Text("Du bist für diesen Kurs angemeldet.")
                                .font(.footnote)
                                .foregroundColor(.gray)

                        } else {

                            Text("Du hast aktuell noch keine Buchung. Dieser Kurs könnte gut zu dir passen.")
                                .font(.footnote)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
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
                            imageName: displayedCourse.imageName,
                            title: displayedCourse.title,
                            time: displayedCourse.time,
                            duration: "60 Min.",
                            level: "Alle Levels",
                            trainer: "Laura",
                            description: "Starte deinen Tag mit einer belebenden Yoga-Praxis für Körper und Geist.",
                            participants: displayedCourse.participants,
                            maxParticipants: 15,
                            isBooked: hasBooking
                        )

                    } label: {

                        PrimaryButton(
                            title: buttonTitle,
                            icon: hasBooking ? "checkmark.circle.fill" : "calendar"
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

        ParticipantDashboardView(
            onShowBookings: {}

        )
    }
    .environmentObject(BookingStore())
    .environment(FavoritesStore())
}
