import SwiftUI

struct ParticipantDashboardView: View {

    // MARK: - Environment

    @EnvironmentObject private var bookingStore: BookingStore
    @EnvironmentObject private var sessionStore: SessionStore
    @EnvironmentObject private var courseStore: CourseStore

    // MARK: - User Information

    private var userName: String {
        sessionStore.profile?.displayName ?? "Benutzer"
    }

    // MARK: - Future Bookings

    /// Alle zukünftigen Buchungen, nächster Kurs zuerst.
    private var upcomingBookings: [Booking] {

        bookingStore.bookings
            .filter { booking in
                booking.course.date > Date()
            }
            .sorted { firstBooking, secondBooking in
                firstBooking.course.date
                    < secondBooking.course.date
            }
    }

    /// Die zeitlich nächste zukünftige Buchung.
    private var nextBooking: Booking? {
        upcomingBookings.first
    }

    /// Lokales Course-Modell der nächsten Buchung.
    private var bookedCourse: Course? {
        nextBooking?.course
    }

    // MARK: - Future Courses

    /// Alle zukünftigen Datenbankkurse, nächster Kurs zuerst.
    private var futureDatabaseCourses: [SupabaseCourse] {

        courseStore.courses
            .filter { course in
                course.startAt > Date()
            }
            .sorted { firstCourse, secondCourse in
                firstCourse.startAt
                    < secondCourse.startAt
            }
    }

    /*
     Wenn eine zukünftige Buchung existiert, wird der passende
     Datenbankkurs anhand der courseID gesucht.

     Wenn keine zukünftige Buchung existiert, wird der nächste
     zukünftige Kurs empfohlen.
     */
    private var displayedDatabaseCourse: SupabaseCourse? {

        if let nextBooking {

            return courseStore.courses.first { course in
                course.id == nextBooking.courseID
            }
        }

        return futureDatabaseCourses.first
    }

    // MARK: - Booking State

    private var hasBooking: Bool {
        nextBooking != nil
    }

    // MARK: - Display Values

    private var displayedTitle: String {
        displayedDatabaseCourse?.title
            ?? bookedCourse?.title
            ?? "Kein Kurs verfügbar"
    }

    private var displayedImageName: String {
        displayedDatabaseCourse?.imageName
            ?? bookedCourse?.imageName
            ?? "ImageCourse01"
    }

    private var displayedDate: Date {
        displayedDatabaseCourse?.startAt
            ?? bookedCourse?.date
            ?? Date()
    }

    private var displayedDuration: String {

        guard let course = displayedDatabaseCourse else {
            return "60 Min."
        }

        return "\(course.durationMinutes) Min."
    }

    private var displayedLevel: String {
        displayedDatabaseCourse?.displayLevel
            ?? "Nicht angegeben"
    }

    private var displayedLevelShort: String {

        switch displayedLevel {

        case "Alle Levels":
            return "Alle"

        case "Fortgeschritten":
            return "Fortgeschritten"

        default:
            return displayedLevel
        }
    }

    private var displayedDescription: String {
        displayedDatabaseCourse?.description
            ?? "Keine Kursbeschreibung hinterlegt."
    }

    private var displayedParticipants: Int {
        displayedDatabaseCourse?.participantCount ?? 0
    }

    private var displayedMaxParticipants: Int {
        displayedDatabaseCourse?.maxParticipants ?? 15
    }

    private var displayedRoom: String {
        displayedDatabaseCourse?.room ?? "Raum 1"
    }

    private var displayedTrainer: String {
        displayedDatabaseCourse?.trainerName
            ?? "Kein Trainer zugeordnet"
    }

    private var displayedCourseDateText: String {

        displayedDate.formatted(
            .dateTime
                .weekday(.short)
                .day()
                .month(.wide)
                .locale(
                    Locale(identifier: "de_DE")
                )
        )
    }

    private var displayedStartTimeText: String {

        guard let course = displayedDatabaseCourse else {
            return bookedCourse?.time ?? "–"
        }

        return course.startAt.formatted(
            .dateTime
                .hour()
                .minute()
                .locale(
                    Locale(identifier: "de_DE")
                )
        ) + " Uhr"
    }

    private var displayedTimeRange: String {

        guard let course = displayedDatabaseCourse else {
            return bookedCourse?.time ?? "–"
        }

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

    private var sectionTitle: String {
        hasBooking
            ? "DEIN NÄCHSTER KURS"
            : "EMPFOHLENER KURS"
    }

    private var buttonTitle: String {
        hasBooking
            ? "Buchung ansehen"
            : "Kursdetails ansehen"
    }

    // MARK: - Body

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

                    headerSection

                    Spacer()
                        .frame(height: 50)

                    courseContent

                    Spacer()
                        .frame(height: 140)
                }
                .padding(.horizontal)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .task {

            if let profileCredits =
                sessionStore.profile?.credits {

                bookingStore.setCredits(
                    profileCredits
                )
            }

            await courseStore.loadCourses()
            await bookingStore.loadBookings()
        }
    }

    // MARK: - Header Section

    private var headerSection: some View {

        VStack(spacing: 10) {

            Text("Namasté")
                .font(.title3)
                .foregroundColor(.yogaGreen)

            Text(userName)
                .font(
                    .system(
                        size: 44,
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
        .padding(.top, 30)
    }

    // MARK: - Course Content

    @ViewBuilder
    private var courseContent: some View {

        if courseStore.isLoading {

            ProgressView("Kurse werden geladen …")
                .padding(.top, 40)

        } else if let errorMessage =
                    courseStore.errorMessage {

            Text(errorMessage)
                .font(.footnote)
                .foregroundColor(.red)
                .multilineTextAlignment(.center)
                .padding(.top, 40)

        } else if displayedDatabaseCourse == nil
                    && bookedCourse == nil {

            noFutureCourseState

        } else {

            VStack(spacing: 18) {

                if !hasBooking {

                    Text(
                        "Du hast aktuell keine kommende Buchung.\nDieser Kurs könnte gut zu dir passen."
                    )
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                }

                courseCard

                courseDetailLink
            }
        }
    }

    // MARK: - No Future Course State

    private var noFutureCourseState: some View {

        VStack(spacing: 14) {

            Image(
                systemName:
                    "calendar.badge.exclamationmark"
            )
            .font(.system(size: 36))
            .foregroundColor(.yogaGold)

            Text("Keine kommenden Kurse")
                .font(
                    .system(
                        size: 26,
                        weight: .semibold,
                        design: .serif
                    )
                )
                .foregroundColor(.yogaGreen)

            Text(
                "Aktuell sind keine zukünftigen Kurse verfügbar."
            )
            .font(.footnote)
            .foregroundColor(.gray)
            .multilineTextAlignment(.center)
        }
        .padding(28)
        .frame(maxWidth: .infinity)
        .background(
            Color.white.opacity(0.82)
        )
        .clipShape(
            RoundedRectangle(cornerRadius: 28)
        )
    }

    // MARK: - Course Card

    private var courseCard: some View {

        VStack(spacing: 18) {

            Text(sectionTitle)
                .font(.caption)
                .fontWeight(.bold)
                .tracking(4)
                .foregroundColor(.yogaGold)

            HStack(
                alignment: .firstTextBaseline,
                spacing: 10
            ) {

                Text(displayedTitle)
                    .font(
                        .system(
                            size: 34,
                            weight: .semibold,
                            design: .serif
                        )
                    )
                    .foregroundColor(.yogaGreen)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .minimumScaleFactor(0.75)

                if hasBooking {

                    Label(
                        "Angemeldet",
                        systemImage:
                            "checkmark.circle.fill"
                    )
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.green)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 6)
                    .background(
                        Color.green.opacity(0.10)
                    )
                    .clipShape(Capsule())
                }
            }

            Divider()
                .padding(.horizontal)

            HStack(spacing: 20) {

                InfoCard(
                    title: "Datum",
                    value: displayedCourseDateText,
                    icon: "calendar"
                )

                InfoCard(
                    title: "Zeit",
                    value: displayedStartTimeText,
                    icon: "clock.fill"
                )
            }

            HStack(spacing: 20) {

                InfoCard(
                    title: "Trainer",
                    value: displayedTrainer,
                    icon: "person.fill"
                )

                InfoCard(
                    title: "Level",
                    value: displayedLevelShort,
                    icon: "figure.yoga"
                )
            }

            if hasBooking {

                Text(
                    "Du bist für diesen Kurs angemeldet."
                )
                .font(.footnote)
                .foregroundColor(.gray)
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
    }

    // MARK: - Course Detail Link

    @ViewBuilder
    private var courseDetailLink: some View {

        if let databaseCourse =
            displayedDatabaseCourse {

            NavigationLink {

                CourseDetailView(
                    courseID: databaseCourse.id,
                    role: .participant,
                    imageName: displayedImageName,
                    title: displayedTitle,
                    time: displayedTimeRange,
                    duration: displayedDuration,
                    level: displayedLevel,
                    trainer: displayedTrainer,
                    room: displayedRoom,
                    description:
                        displayedDescription,
                    participants:
                        displayedParticipants,
                    maxParticipants:
                        displayedMaxParticipants,
                    isBooked: hasBooking,
                    courseDate: displayedDate
                )

            } label: {

                PrimaryButton(
                    title: buttonTitle,
                    icon:
                        hasBooking
                        ? "checkmark.circle.fill"
                        : "calendar"
                )
            }
            .buttonStyle(.plain)

        } else {

            PrimaryButton(
                title: "Kein Kurs verfügbar",
                icon:
                    "calendar.badge.exclamationmark"
            )
            .opacity(0.55)
            .allowsHitTesting(false)
        }
    }
}

// MARK: - Preview

#Preview {

    NavigationStack {

        ParticipantDashboardView(
        )
    }
    .environmentObject(BookingStore())
    .environmentObject(SessionStore())
    .environmentObject(CourseStore())
    .environment(FavoritesStore())
}
