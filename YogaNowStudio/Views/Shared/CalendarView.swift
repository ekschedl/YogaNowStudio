import SwiftUI

struct CalendarView: View {

    let role: UserRole

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
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .padding(.top, 50)

                    // MARK: Kalender

                    VStack(spacing: 8) {

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

                        Text(
                            selectedDate.formatted(
                                .dateTime
                                    .weekday(.wide)
                                    .day()
                                    .month(.wide)
                                    .locale(Locale(identifier: "de_DE"))
                            )
                            .uppercased()
                        )
                        .font(.caption)
                        .fontWeight(.bold)
                        .tracking(4)
                        .foregroundColor(.yogaGold)
                        .padding(.bottom, 18)
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

                    // MARK: Kurse an diesem Tag
                    VStack(alignment: .leading, spacing: 6) {
                        Text("AUSGEWÄHLTER TAG")
                            .font(.caption)
                            .fontWeight(.bold)
                            .tracking(4)
                            .foregroundColor(.yogaGold)
                        Text("Deine Kurse")
                            .font(
                                .system(
                                    size: 32,
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
                    .padding(.top, 4)
                        
            
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
        .navigationBarTitleDisplayMode(.inline)
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
                role: role,
                imageName: image,
                title: title,
                time: time,
                duration: "60 Min.",
                level: "Alle Levels",
                trainer: "Laura",
                description: "Kursbeschreibung",
                participants: participants,
                maxParticipants: 15,
                isBooked: role == .participant
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
}

#Preview {

    NavigationStack {
        CalendarView(
            role: .participant
        )
    }
    .environment(FavoritesStore())
}
