import SwiftUI

struct CalendarView: View {

    @State private var selectedDate = Date()

    var body: some View {

        ZStack {

            Image("BackgroundYoga")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            ScrollView(showsIndicators: false) {

                VStack(spacing: 24) {

                    // MARK: Header

                    VStack(spacing: 8) {

                        Text("Dein Kalender")
                            .font(
                                .system(
                                    size: 28,
                                    weight: .semibold,
                                    design: .serif
                                )
                            )
                            .foregroundColor(.yogaGreen)

                        Text(
                            selectedDate.formatted(
                                .dateTime
                                    .weekday(.wide)
                                    .day()
                                    .month(.wide)
                                    .locale(Locale(identifier: "de_DE"))
                            )
                        )
                        .font(.footnote)
                        .fontWeight(.bold)
                        .tracking(3)
                        .foregroundColor(.yogaGold)
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 16)
                    .background(.ultraThickMaterial)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 24)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 24)
                            .stroke(
                                Color.white.opacity(0.6),
                                lineWidth: 1
                            )
                    ).padding(.top,50)

                    // MARK: Kalender

                    VStack {

                        DatePicker(
                            "",
                            selection: $selectedDate,
                            displayedComponents: [.date]
                        )
                        .datePickerStyle(.graphical)
                        .scaleEffect(0.9)
                        .labelsHidden()
                        .environment(
                            \.locale,
                             Locale(identifier: "de_DE")
                        )
                        .tint(.yogaGreen)
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 32)
                            .fill(
                                LinearGradient(
                                    colors: [
                                        Color.white.opacity(0.95),
                                        Color.yogaCream.opacity(0.95)
                                    ],
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 32)
                            .stroke(
                                Color.white.opacity(0.8),
                                lineWidth: 1
                            )
                    )

                    // MARK: Datum
                    VStack(
                        alignment: .leading,
                        spacing: 6
                    ) {

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

                    // MARK: Kurse
                    courseLink(
                        image: "ImageCourse01",
                        title: "Morning Flow",
                        time: "08:30 Uhr",
                        participants: 12
                    )

                    courseLink(
                        image: "ImageCourse02",
                        title: "Yin Yoga",
                        time: "17:30 Uhr",
                        participants: 6
                    )

                    courseLink(
                        image: "ImageCourse03",
                        title: "Deep Balance",
                        time: "19:00 Uhr",
                        participants: 8
                    )
                    Spacer()
                        .frame(height: 100)
                }
                .padding(.horizontal)
            }
        }

        }
    }

    // MARK: Kurs-Link

    @ViewBuilder
    private func courseLink(
        image: String,
        title: String,
        time: String,
        participants: Int
    ) -> some View {

        NavigationLink {

            CourseDetailView(
                role: .trainer,
                imageName: image,
                title: title,
                time: time,
                duration: "60 Min.",
                level: "Alle Levels",
                trainer: "Laura",
                description: "Kursbeschreibung",
                participants: participants,
                maxParticipants: 15,
                isBooked: false
            )

        } label: {

            CourseCardView(
                imageName: image,
                title: title,
                time: time,
                participants: participants
            )
        }
    }


#Preview {

    NavigationStack {

        CalendarView()

    }
    .environment(FavoritesStore())
}
