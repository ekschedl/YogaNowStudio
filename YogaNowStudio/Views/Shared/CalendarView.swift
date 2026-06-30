import SwiftUI

struct CalendarView: View {

    // MARK: - Environment

    @EnvironmentObject private var bookingStore: BookingStore
    @EnvironmentObject private var courseStore: CourseStore
    @EnvironmentObject private var sessionStore: SessionStore

    // MARK: - Properties

    let role: UserRole

    // MARK: - State

    @State private var selectedDate = Date()

    // MARK: - Computed Properties

    private var coursesForSelectedDay: [SupabaseCourse] {

        courseStore.courses
            .filter { course in

                Calendar.current.isDate(
                    course.startAt,
                    inSameDayAs: selectedDate
                )
            }
            .sorted { firstCourse, secondCourse in

                firstCourse.startAt
                    < secondCourse.startAt
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
        .task {

            await loadCourses()

            if role == .participant {
                await bookingStore.loadBookings()
            }
        }
    }

    // MARK: - Header Section

    private var headerSection: some View {

        VStack(spacing: 8) {

            Spacer()

            Text("Kalender")
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
                        .locale(
                            Locale(identifier: "de_DE")
                        )
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
        .frame(
            maxWidth: .infinity,
            alignment: .leading
        )
    }

    // MARK: - Courses Section

    @ViewBuilder
    private var coursesSection: some View {

        if courseStore.isLoading {

            ProgressView("Kurse werden geladen …")
                .padding(.vertical, 30)

        } else if let errorMessage =
                    courseStore.errorMessage {

            Text(errorMessage)
                .font(.footnote)
                .foregroundColor(.red)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 30)

        } else if coursesForSelectedDay.isEmpty {

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

            Image(
                systemName:
                    "calendar.badge.exclamationmark"
            )
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

            Text(
                role == .trainer
                    ? "Du hast an diesem Tag keine zugewiesenen Kurse."
                    : "Für diesen Tag sind aktuell keine Kurse eingetragen."
            )
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
        course: SupabaseCourse
    ) -> some View {

        let booked =
            role == .participant
            && isCourseBooked(course)

        let isPastCourse =
            course.startAt <= Date()

        return NavigationLink {

            CourseDetailView(
                courseID: course.id,
                role: role,
                imageName:
                    course.imageName
                    ?? "ImageCourse01",
                title: course.title,
                time: timeRange(for: course),
                duration:
                    "\(course.durationMinutes) Min.",
                level: course.displayLevel,
                trainer: course.trainerName,
                room:
                    course.room
                    ?? "Raum 1",
                description:
                    course.description
                    ?? "Keine Beschreibung hinterlegt.",
                participants:
                    course.participantCount,
                maxParticipants:
                    course.maxParticipants,
                isBooked: booked,
                onShowBookings: {},
                courseDate: course.startAt
            )

        } label: {

            CourseCalendarCardView(

                imageName:

                    course.imageName

                    ?? "ImageCourse01",

                title: course.title,

                time: "\(startTime(for: course)) Uhr",

                participants:

                    course.participantCount,

                isBooked: booked

            )

            .saturation(

                isPastCourse ? 0.75 : 1

            )

            .opacity(

                isPastCourse ? 0.72 : 1

            )

        }
        .buttonStyle(.plain)
    }

    // MARK: - Load Courses

    private func loadCourses() async {

        if role == .trainer {

            guard let trainerID =
                    sessionStore.profile?.id
            else {
                return
            }

            await courseStore.loadCourses(
                for: trainerID
            )

        } else {

            await courseStore.loadCourses()
        }
    }

    // MARK: - Time Formatting

    private func startTime(
        for course: SupabaseCourse
    ) -> String {

        course.startAt.formatted(
            .dateTime
                .hour()
                .minute()
                .locale(
                    Locale(identifier: "de_DE")
                )
        )
    }

    private func timeRange(
        for course: SupabaseCourse
    ) -> String {

        let endDate =
            Calendar.current.date(
                byAdding: .minute,
                value: course.durationMinutes,
                to: course.startAt
            ) ?? course.startAt

        let start =
            course.startAt.formatted(
                .dateTime
                    .hour()
                    .minute()
                    .locale(
                        Locale(identifier: "de_DE")
                    )
            )

        let end =
            endDate.formatted(
                .dateTime
                    .hour()
                    .minute()
                    .locale(
                        Locale(identifier: "de_DE")
                    )
            )

        return "\(start) - \(end)"
    }

    // MARK: - Booking Check
    
    private func isCourseBooked(
        _ course: SupabaseCourse
    ) -> Bool {
        bookingStore.isBooked(
            courseID: course.id
        )
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
    .environmentObject(SessionStore())
    .environmentObject(CourseStore())
    .environment(FavoritesStore())
}
