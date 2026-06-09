import SwiftUI

struct CalendarView: View {

    @State private var selectedDate = Date()

    var body: some View {

        ZStack(alignment: .bottom) {

            Image("BackgroundYoga")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            ScrollView(showsIndicators: false) {

                VStack(spacing: 24) {

                    VStack(spacing: 6) {
                        Text("Dein Kalender")
                            .font(
                                .system(
                                    size: 30,
                                    weight: .semibold,
                                    design: .serif
                                )
                            )
                            .foregroundColor(.yogaGreen)

                        Text("Wähle einen Kurstag")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .padding(24)

                    VStack(spacing: 16) {

                        DatePicker(
                            "Datum wählen",
                            selection: $selectedDate,
                            displayedComponents: [.date]
                        )
                        .datePickerStyle(.graphical)
                        .labelsHidden()
                        .accentColor(.yogaGreen)
                        .environment(\.locale, Locale(identifier: "de_DE"))

                    }
                    .padding(24)
                    .background(
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color.yogaCream.opacity(0.95))
                    )
                    .shadow(
                        color: .black.opacity(0.08),
                        radius: 15,
                        y: 5
                    )

                    VStack(
                        alignment: .leading,
                        spacing: 6
                    ) {

                        Text(
                            selectedDate.formatted(
                                .dateTime
                                    .weekday(.wide)
                                    .day()
                                    .month(.wide)
                                    .locale(Locale(identifier: "de_DE"))
                            )
                        )
                        .font(.caption)
                        .foregroundColor(.yogaGreen)

                        Text("Kurse an diesem Tag")
                            .font(
                                .system(
                                    size: 28,
                                    weight: .semibold,
                                    design: .serif
                                )
                            )
                            .foregroundColor(.yogaGreen)
                    }
                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )

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
                            maxParticipants: 15
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
                            maxParticipants: 12
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
                            maxParticipants: 12
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
                .padding(.horizontal)
                .padding(.top, 20)
                .padding(.bottom, 140)
            }

            FooterView(
                selectedTab: .calendar
            )
        }
        .ignoresSafeArea(edges: .bottom)
      
    }
}

#Preview {

    NavigationStack {

        CalendarView()

    }
    .environment(FavoritesStore())
}
