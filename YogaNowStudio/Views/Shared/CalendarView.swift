import SwiftUI

struct CalendarView: View {

    // MARK: - Environment

    @EnvironmentObject private var bookingStore: BookingStore

    // MARK: - Properties

    let role: UserRole

    // MARK: - State

    @State private var selectedDate = Calendar.current.date(
        from: DateComponents(
            year: 2026,
            month: 6,
            day: 18
        )
    ) ?? Date()

    // MARK: - Mock Courses

    private var courses: [Course] {

        [
            Course(
                title: "Morning Flow",
                day: "Donnerstag",
                date: makeDate(
                    year: 2026,
                    month: 6,
                    day: 18
                ),
                time: "08:30 Uhr",
                room: "Raum 1",
                participants: 12,
                imageName: "ImageCourse01"
            ),
            Course(
                title: "Yin Yoga",
                day: "Donnerstag",
                date: makeDate(
                    year: 2026,
                    month: 6,
                    day: 18
                ),
                time: "17:30 Uhr",
                room: "Raum 1",
                participants: 6,
                imageName: "ImageCourse02"
            ),
            Course(
                title: "Deep Balance",
                day: "Freitag",
                date: makeDate(
                    year: 2026,
                    month: 6,
                    day: 19
                ),
                time: "19:00 Uhr",
                room: "Raum 1",
                participants: 8,
                imageName: "ImageCourse03"
            )
        ]
    }

    // MARK: - Computed Properties

    private var coursesForSelectedDay: [Course] {

        courses.filter {
            Calendar.current.isDate(
                $0.date,
                inSameDayAs: selectedDate
            )
        }
    }

    // MARK: - Body

    var body: some View {

        ZStack {

            Image("BackgroundYoga")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            ScrollView(showsIndicators: false) {

                VStack(spacing: 24) {

                    headerSection

                    calendarSection

                    selectedDayHeader

                    coursesSection

                    Spacer()
                        .frame(height: 100)
                }
                .padding(.horizontal)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }

    // MARK: - Header Section

    private var headerSection: some View {

        VStack(spacing: 8) {

            Spacer()

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
    }

    // MARK: - Calendar Section

    private var calendarSection: some View {

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
                            Color.white.opacity(0.96),
                            Color.yogaCream.opacity(0.82),
                            Color.white.opacity(0.92)
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
        )
    }

    // MARK: - Selected Day Header

    private var selectedDayHeader: some View {

        VStack(alignment: .leading, spacing: 6) {

            Text("AUSGEWÄHLTER TAG")
                .font(.caption)
                .fontWeight(.bold)
                .tracking(4)
                .foregroundColor(.yogaGold)

            Text(
                role == .participant
                ? "Kurse an diesem Tag"
                : "Deine Kurse"
            )
            .font(
                .system(
                    size: 30,
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
    }

    // MARK: - Courses Section

    @ViewBuilder
    private var coursesSection: some View {

        if coursesForSelectedDay.isEmpty {

            emptyState

        } else {

            ForEach(coursesForSelectedDay) { course in

                courseLink(
                    course: course
                )
            }
        }
    }

    // MARK: - Empty State

    private var emptyState: some View {

        VStack(spacing: 14) {

            Image(systemName: "calendar.badge.exclamationmark")
                .font(.system(size: 32))
                .foregroundColor(.yogaGold)

            Text("Keine Kurse")
                .font(
                    .system(
                        size: 26,
                        weight: .semibold,
                        design: .serif
                    )
                )
                .foregroundColor(.yogaGreen)

            Text("Für diesen Tag sind aktuell keine Kurse eingetragen.")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
        }
        .padding(26)
        .frame(maxWidth: .infinity)
        .background(
            Color.white.opacity(0.78)
        )
        .clipShape(
            RoundedRectangle(cornerRadius: 26)
        )
    }

    // MARK: - Course Link

    private func courseLink(
        course: Course
    ) -> some View {

        NavigationLink {

            CourseDetailView(
                role: role,
                imageName: course.imageName,
                title: course.title,
                time: course.time,
                duration: "60 Min.",
                level: "Alle Levels",
                trainer: "Laura",
                description: "Kursbeschreibung",
                participants: course.participants,
                maxParticipants: 15,
                isBooked: isCourseBooked(course),
                onShowBookings: {},
                courseDate: course.date
            )

        } label: {

            CourseCalendarCardView(
                imageName: course.imageName,
                title: course.title,
                time: course.time,
                participants: course.participants,
                isBooked: isCourseBooked(course)
            )
        }
    }

    // MARK: - Booking Check
    private func isCourseBooked(
        _ course: Course
    ) -> Bool {
        bookingStore.bookings.contains { booking in
            booking.course.title == course.title &&
            Calendar.current.isDate(
                booking.course.date,
                inSameDayAs: course.date
            )
        }
    }
    // MARK: - Date Helper

    private func makeDate(
        year: Int,
        month: Int,
        day: Int
    ) -> Date {

        Calendar.current.date(
            from: DateComponents(
                year: year,
                month: month,
                day: day
            )
        ) ?? Date()
    }
}

// MARK: - Preview

#Preview {

    NavigationStack {

        CalendarView(
            role: .participant
        )
    }
    .environmentObject(BookingStore())
    .environment(FavoritesStore())
}
