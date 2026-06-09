import SwiftUI

struct TrainerDashboardView: View {

    var body: some View {

        ZStack(alignment: .bottom) {

            Image("BackgroundYoga")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            ScrollView(showsIndicators: false) {

                VStack {

                    VStack(spacing: 4) {

                        Text("Namasté")
                            .font(.subheadline)
                            .foregroundColor(.yogaGreen)

                        Text("Valerie")
                            .font(
                                .system(
                                    size: 36,
                                    weight: .semibold,
                                    design: .serif
                                )
                            )
                             .tracking(2)
                            .foregroundColor(.yogaGold)

                        Text("3 Kurse heute • 26 Teilnehmer")
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                    .padding(.top, 70)
                    

                    VStack(spacing: 10) {

                        VStack(alignment: .leading, spacing: 8) {

                            Text("HEUTE")
                                .font(.caption2)
                                .fontWeight(.bold)
                                .foregroundColor(.yogaGold)
                                .tracking(4)

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

                            Rectangle()
                                .fill(Color.yogaGold.opacity(0.3))
                                .frame(width: 70, height: 1)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        .padding(.top, 20)
                        
                        NavigationLink {
                            CourseDetailView(
                                role: .trainer,
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
                        } label: {
                            CourseCardView(
                                imageName: "ImageCourse01",
                                title: "Morning Flow",
                                time: "08:30 Uhr",
                                participants: 12
                            )
                        }

                        NavigationLink {
                            CourseDetailView(
                                role: .trainer,
                                imageName: "ImageCourse02",
                                title: "Yin Yoga",
                                time: "17:30 - 18:30",
                                duration: "60 Min.",
                                level: "Anfänger",
                                trainer: "Sarah",
                                description: "Sanfte Yoga-Einheit für Entspannung und Beweglichkeit.",
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

                        NavigationLink {
                            CourseDetailView(
                                role: .trainer,
                                imageName: "ImageCourse03",
                                title: "Deep Balance",
                                time: "19:00 - 20:00",
                                duration: "60 Min.",
                                level: "Fortgeschritten",
                                trainer: "Emma",
                                description: "Balance, Kraft und Fokus für Körper und Geist.",
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
                    }
                    .padding(24)
                  
                }

            }
        
        }

    }
}

#Preview {
    NavigationStack {
        TrainerDashboardView()
    }
    .environment(FavoritesStore())
}
