import SwiftUI

struct CourseDetailView: View {

    // MARK: - Environment

    @EnvironmentObject private var bookingStore: BookingStore

    // MARK: - State

    @State private var showBookingPopup = false
    @State private var showBookingSuccess = false
    @State private var isBooking = false

    // MARK: - Properties
    let courseID: UUID
    
    let role: UserRole
    let imageName: String
    let title: String
    let time: String
    let duration: String
    let level: String
    let trainer: String
    let room: String
    let description: String
    let participants: Int
    let maxParticipants: Int
    let isBooked: Bool
    let onShowBookings: () -> Void
    let courseDate: Date

    // MARK: - Initialization

    init(
        courseID: UUID,
        role: UserRole,
        imageName: String,
        title: String,
        time: String,
        duration: String,
        level: String,
        trainer: String,
        room: String = "Raum 1",
        description: String,
        participants: Int,
        maxParticipants: Int,
        isBooked: Bool,
        onShowBookings: @escaping () -> Void = {},
        courseDate: Date = Date()
    ) {
        self.courseID = courseID
        self.role = role
        self.imageName = imageName
        self.title = title
        self.time = time
        self.duration = duration
        self.level = level
        self.trainer = trainer
        self.room = room
        self.description = description
        self.participants = participants
        self.maxParticipants = maxParticipants
        self.isBooked = isBooked
        self.onShowBookings = onShowBookings
        self.courseDate = courseDate
    }

    // MARK: - Computed Properties

    private var courseDay: String {
        courseDate.formatted(
            .dateTime
                .weekday(.wide)
                .locale(Locale(identifier: "de_DE"))
        )
    }

    private var courseDateText: String {
        courseDate.formatted(
            .dateTime
                .weekday(.short)
                .day()
                .month(.wide)
                .locale(Locale(identifier: "de_DE"))
        )
    }

    private var freePlaces: Int {
        max(0, maxParticipants - participants)
    }

    private var participantText: String {
        participants == 1
            ? "1 Teilnehmer"
            : "\(participants) Teilnehmer"
    }

    private var freePlacesText: String {
        if freePlaces == 0 {
            return "Ausgebucht"
        }

        if freePlaces == 1 {
            return "1 von \(maxParticipants) frei"
        }

        return "\(freePlaces) von \(maxParticipants) frei"
    }

    private var course: Course {
        Course(
            title: title,
            day: courseDay,
            date: courseDate,
            time: time,
            room: room,
            participants: participants,
            imageName: imageName
        )
    }

    // MARK: - Body

    var body: some View {

        ScrollView(showsIndicators: false) {

            VStack(spacing: 0) {

                courseImage

                contentSection

                bottomFade
            }
        }
        .ignoresSafeArea(edges: .top)
        .navigationBarTitleDisplayMode(.inline)
        .safeAreaInset(edge: .bottom) {
            bottomActionButton
        }
        .overlay {
            bookingPopupOverlay
        }
        .navigationDestination(
            isPresented: $showBookingSuccess
        ) {
            BookingSuccessView(
                course: course,
                onFinish: onShowBookings
            )
        }
    }

    // MARK: - Course Image

    private var courseImage: some View {

        Image(imageName)
            .resizable()
            .scaledToFill()
            .frame(height: 230)
            .clipped()
    }

    // MARK: - Content Section

    private var contentSection: some View {

        VStack(alignment: .leading, spacing: 12) {

            titleSection

            HStack(spacing: 12) {

                detailInfoCard(
                    title: "Datum",
                    value: courseDateText,
                    icon: "calendar"
                )

                detailInfoCard(
                    title: "Zeit",
                    value: time,
                    icon: "clock.fill"
                )
            }

            HStack(spacing: 12) {

                detailInfoCard(
                    title: "Level",
                    value: level,
                    icon: "figure.yoga"
                )

                if role == .trainer {

                    detailInfoCard(
                        title: "Raum",
                        value: room,
                        icon: "door.left.hand.open"
                    )

                } else {

                    detailInfoCard(
                        title: "Trainer",
                        value: trainer,
                        icon: "person.fill"
                    )
                }
            }

            descriptionCard

            if role == .participant {
                participantBookingCard
            } else {
                trainerParticipantCard
            }
        }
        .padding(.horizontal, 26)
        .padding(.top, 28)
        .padding(.bottom, 20)
        .frame(
            maxWidth: .infinity,
            alignment: .topLeading
        )
        .background(
            Color.yogaCream
        )
    }

    // MARK: - Title Section

    private var titleSection: some View {

        HStack(
            alignment: .center,
            spacing: 12
        ) {

            Text(title)
                .font(
                    .system(
                        size: 30,
                        weight: .semibold,
                        design: .serif
                    )
                )
                .foregroundColor(.yogaGreen)
                .lineLimit(2)
                .minimumScaleFactor(0.65)
                .layoutPriority(1)

            Spacer(minLength: 6)

            if role == .participant && isBooked {

                Label(
                    "Angemeldet",
                    systemImage: "checkmark.circle.fill"
                )
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(.green)
                .padding(.horizontal, 10)
                .padding(.vertical, 7)
                .background(
                    Color.green.opacity(0.10)
                )
                .clipShape(Capsule())
                .fixedSize()
            }
        }
        .padding(.bottom, 6)
    }
    // MARK: - Detail Info Card

    private func detailInfoCard(
        title: String,
        value: String,
        icon: String
    ) -> some View {

        VStack(
            alignment: .leading,
            spacing: 7
        ) {

            Label(
                title.uppercased(),
                systemImage: icon
            )
            .font(.caption2)
            .fontWeight(.bold)
            .tracking(2.5)
            .foregroundColor(.yogaGold)

            Text(value)
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(.yogaGreen)
                .lineLimit(2)
                .minimumScaleFactor(0.68)
        }
        .frame(
            maxWidth: .infinity,
            minHeight: 76,
            alignment: .leading
        )
        .padding(.horizontal, 15)
        .padding(.vertical, 12)
        .background(
            Color.white.opacity(0.82)
        )
        .clipShape(
            RoundedRectangle(cornerRadius: 20)
        )
    }

    // MARK: - Description Card

    private var descriptionCard: some View {

        VStack(alignment: .leading, spacing: 10) {

            Text("KURSBESCHREIBUNG")
                .font(.caption)
                .fontWeight(.bold)
                .tracking(3)
                .foregroundColor(.yogaGold)

            Text(description)
                .font(.body)
                .foregroundColor(.primary)
                .lineSpacing(3)
        }
        .padding(.horizontal, 18)
        .padding(.vertical, 16)
        .frame(
            maxWidth: .infinity,
            alignment: .leading
        )
        .background(
            Color.white.opacity(0.72)
        )
        .clipShape(
            RoundedRectangle(cornerRadius: 20)
        )
    }

    // MARK: - Participant Booking Card

    private var participantBookingCard: some View {

        HStack {

            Text("PLÄTZE")
                .font(.caption)
                .fontWeight(.bold)
                .tracking(3)
                .foregroundColor(.yogaGold)

            Spacer()

            Text(freePlacesText)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(
                    freePlaces == 0
                        ? .red
                        : .yogaGreen
                )
        }
        .padding(.horizontal, 18)
        .padding(.vertical, 16)
        .frame(
            maxWidth: .infinity,
            alignment: .leading
        )
        .background(
            Color.white.opacity(0.72)
        )
        .clipShape(
            RoundedRectangle(cornerRadius: 20)
        )
    }

    // MARK: - Trainer Participant Card

    private var trainerParticipantCard: some View {

        VStack(alignment: .leading, spacing: 8) {

            Text("TEILNEHMER")
                .font(.caption)
                .fontWeight(.bold)
                .tracking(3)
                .foregroundColor(.yogaGold)

            Text(participantText)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.yogaGreen)

            Text("\(freePlaces) Plätze verfügbar")
                .font(.footnote)
                .foregroundColor(.gray)
        }
        .padding(.horizontal, 18)
        .padding(.vertical, 16)
        .frame(
            maxWidth: .infinity,
            alignment: .leading
        )
        .background(
            Color.white.opacity(0.72)
        )
        .clipShape(
            RoundedRectangle(cornerRadius: 20)
        )
    }

    // MARK: - Bottom Fade

    private var bottomFade: some View {

        LinearGradient(
            colors: [
                Color.white.opacity(0.96),
                Color.yogaCream.opacity(0.70),
                Color.white
            ],
            startPoint: .top,
            endPoint: .bottom
        )
        .frame(height: 50)
    }

    // MARK: - Bottom Action Button

    private var bottomActionButton: some View {

        Group {
            if role == .participant {
                if isBooked {
                    Button {
                        cancelBooking()
                    } label: {
                        SecondaryButton(
                            title: "Buchung stornieren",
                            icon: "xmark.circle"
                        )
                    }
                } else {
                    Button {
                        showBookingPopup = true
                    } label: {
                        PrimaryButton(
                            title: "Kurs buchen",
                            icon: "calendar.badge.plus"
                        )
                    }
                    .disabled(freePlaces == 0)
                    .opacity(freePlaces == 0 ? 0.55 : 1)
                }
            } else {
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
        .padding(.horizontal)
        .padding(.top, 8)
        .padding(.bottom, 8)
        .background(
            Color.yogaCream
        )
    }

    // MARK: - Booking Popup Overlay

    @ViewBuilder
    private var bookingPopupOverlay: some View {

        if showBookingPopup {

            BookingConfirmPopupView(
                course: course,
                credits: bookingStore.credits,
                isBooking: isBooking,
                errorMessage: bookingStore.errorMessage,
                onCancel: {
                    showBookingPopup = false
                },
                onConfirm: {
                    Task {
                        await confirmBooking()
                    }
                }
            )
        }
    }

    // MARK: - Actions

    private func cancelBooking() {

        guard let booking = bookingStore.bookings.first(
            where: {
                $0.course.title == course.title
            }
        ) else {
            return
        }

        Task {

            await bookingStore.cancel(
                booking: booking
            )

            onShowBookings()
        }
    }

    private func confirmBooking() async {

        guard freePlaces > 0 else {
            return
        }

        isBooking = true
        bookingStore.errorMessage = nil

        let success = await bookingStore.book(
            courseID: courseID,
            course: course
        )

        isBooking = false

        if success {
            showBookingPopup = false
            showBookingSuccess = true
        }
    }
}

// MARK: - Preview

#Preview {

    NavigationStack {

        CourseDetailView(
            courseID: UUID(),
            role: .participant,
            imageName: "ImageCourse01",
            title: "Morning Flow",
            time: "08:30 - 09:30",
            duration: "60 Min.",
            level: "Alle Levels",
            trainer: "Laura",
            room: "Raum 1",
            description:
                "Starte deinen Tag mit einer belebenden Yoga-Praxis für Körper und Geist.",
            participants: 12,
            maxParticipants: 15,
            isBooked: false,
            onShowBookings: {},
            courseDate: Date()
        )
    }
    .environment(FavoritesStore())
    .environmentObject(BookingStore())
}
