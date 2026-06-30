//
//  MyBookingsView.swift
//  YogaNowStudio
//
//  Created by Kaaatkina on 09.06.26.
//

import SwiftUI

struct MyBookingsView: View {

    // MARK: - Environment

    @EnvironmentObject private var bookingStore: BookingStore
    @EnvironmentObject private var courseStore: CourseStore

    // MARK: - State

    @State private var selectedSegment: BookingSegment = .upcoming
    @State private var bookingToCancel: Booking?
    @State private var showCancelConfirmation = false
    @State private var showCancelSuccess = false
    @State private var showCancelError = false
    @State private var cancellationRefunded = false
    @State private var isCancelling = false

    // MARK: - Segment

    private enum BookingSegment: String, CaseIterable {
        case past = "Vergangene"
        case upcoming = "Kommende"
    }

    // MARK: - Filtered Bookings

    private var pastBookings: [Booking] {
        bookingStore.bookings
            .filter { $0.course.date <= Date() }
            .sorted { $0.course.date > $1.course.date }
    }

    
    private var upcomingBookings: [Booking] {
        bookingStore.bookings
            .filter { $0.course.date > Date() }
            .sorted { $0.course.date < $1.course.date }
    }


    private var displayedBookings: [Booking] {
        switch selectedSegment {
        case .upcoming:
            return upcomingBookings
        case .past:
            return pastBookings
        }
    }

    //MARK: - bookCountText
    private func bookingCountText(
        count: Int,
        singular: String,
        plural: String
    ) -> String {
        count == 1
            ? "1 \(singular)"
            : "\(count) \(plural)"
    }
    // MARK: - Date Formatting

    private func formattedDate(
        for booking: Booking
    ) -> String {

        booking.course.date.formatted(
            .dateTime
                .weekday(.wide)
                .day()
                .month(.wide)
                .locale(Locale(identifier: "de_DE"))
        )
    }

    // MARK: - Cancellation Rule

    private var receivesCreditBack: Bool {

        guard let bookingToCancel else {
            return false
        }

        let cancellationLimit =
            Date().addingTimeInterval(
                24 * 60 * 60
            )

        return bookingToCancel.course.date >
            cancellationLimit
    }

    // MARK: - Body

    var body: some View {

        ZStack {

            Image("BackgroundYoga")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            ScrollView(showsIndicators: false) {

                VStack(spacing: 22) {

                    headerSection

                    segmentControl

                    if displayedBookings.isEmpty {
                        emptyState
                    } else {
                        bookingsSection
                    }

                    Spacer()
                        .frame(height: 110)
                }
                .padding(.horizontal)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .confirmationDialog(
            "Buchung wirklich stornieren?",
            isPresented: $showCancelConfirmation,
            titleVisibility: .visible
        ) {

            Button(
                "Buchung stornieren",
                role: .destructive
            ) {
                cancelSelectedBooking()
            }

            Button(
                "Abbrechen",
                role: .cancel
            ) {
                bookingToCancel = nil
            }

        } message: {

            if receivesCreditBack {

                Text(
                    "Die Buchung wird entfernt. Dein Credit wird zurückgegeben."
                )

            } else {

                Text(
                    "Der Kurs beginnt in weniger als 24 Stunden. Die Buchung wird storniert, aber du erhältst keinen Credit zurück."
                )
            }
        }
        .alert(
            "Kurs storniert",
            isPresented: $showCancelSuccess
        ) {

            Button("OK") {
                bookingToCancel = nil
            }

        } message: {

            if cancellationRefunded {

                Text(
                    "Die Buchung wurde erfolgreich storniert. Dein Credit wurde zurückgegeben."
                )

            } else {

                Text(
                    "Die Buchung wurde erfolgreich storniert. Da der Kurs in weniger als 24 Stunden beginnt, wurde kein Credit zurückgegeben."
                )
            }
        }
        .alert(
            "Stornierung fehlgeschlagen",
            isPresented: $showCancelError
        ) {

            Button("OK") {
                bookingToCancel = nil
            }

        } message: {

            Text(
                bookingStore.errorMessage
                    ?? "Die Buchung konnte nicht storniert werden."
            )
        }
        .task {
            if courseStore.courses.isEmpty {
                await courseStore.loadCourses()
            }

            await bookingStore.loadBookings()
        }
    }

    // MARK: - Header

    private var headerSection: some View {

        VStack(spacing: 8) {

            Spacer()
            Spacer()

            Text("Buchungen")
                .font(
                    .system(
                        size: 30,
                        weight: .semibold,
                        design: .serif
                    )
                )
                .foregroundColor(.yogaGreen)

            Text(
                selectedSegment == .upcoming
                ? bookingCountText(
                    count: upcomingBookings.count,
                    singular: "KOMMENDER KURS",
                    plural: "KOMMENDE KURSE"
                )
                : bookingCountText(
                    count: pastBookings.count,
                    singular: "VERGANGENER KURS",
                    plural: "VERGANGENE KURSE"
                )
            )
            .font(.caption)
            .fontWeight(.bold)
            .tracking(3)
            .foregroundColor(.yogaGold)
        }
        .padding(.top, 80)
    }

    // MARK: - Segment Control

    private var segmentControl: some View {

        HStack(spacing: 0) {

            ForEach(BookingSegment.allCases, id: \.self) { segment in

                Button {

                    withAnimation(.easeInOut(duration: 0.2)) {
                        selectedSegment = segment
                    }

                } label: {

                    Text(segment.rawValue)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(
                            selectedSegment == segment
                            ? .white
                            : .yogaGreen
                        )
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                        .background(
                            selectedSegment == segment
                            ? Color.yogaGreen
                            : Color.clear
                        )
                        .clipShape(
                            RoundedRectangle(cornerRadius: 18)
                        )
                }
            }
        }
        .padding(5)
        .background(
            Color.white.opacity(0.82)
        )
        .clipShape(
            RoundedRectangle(cornerRadius: 22)
        )
    }

    // MARK: - Empty State

    private var emptyState: some View {

        VStack(spacing: 16) {

            Image(
                systemName:
                    selectedSegment == .upcoming
                    ? "calendar.badge.exclamationmark"
                    : "clock.badge.xmark"
            )
            .font(.system(size: 38))
            .foregroundColor(.yogaGold)

            Text(
                selectedSegment == .upcoming
                ? "Keine kommenden Kurse"
                : "Keine vergangenen Kurse"
            )
            .font(
                .system(
                    size: 26,
                    weight: .semibold,
                    design: .serif
                )
            )
            .foregroundColor(.yogaGreen)

            Text(
                selectedSegment == .upcoming
                ? "Du hast aktuell keine zukünftigen Kurse gebucht."
                : "Du hast noch keine vergangenen Buchungen."
            )
            .font(.subheadline)
            .foregroundColor(.gray)
            .multilineTextAlignment(.center)
        }
        .padding(30)
        .frame(maxWidth: .infinity)
        .background(
            Color.white.opacity(0.78)
        )
        .clipShape(
            RoundedRectangle(cornerRadius: 28)
        )
    }

    // MARK: - Bookings Section

    private var bookingsSection: some View {

        ForEach(displayedBookings) { booking in

            bookingCard(
                booking: booking,
                isPast: selectedSegment == .past
            )
        }
    }

    // MARK: - Booking Card

    private func databaseCourse(
        for booking: Booking
    ) -> SupabaseCourse? {

        courseStore.courses.first {
            $0.id == booking.courseID
        }
    }

    private func bookingCard(
        booking: Booking,
        isPast: Bool
    ) -> some View {

        let course = databaseCourse(for: booking)

        return VStack(
            alignment: .leading,
            spacing: 14
        ) {

            HStack {

                Text(booking.course.title)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.yogaGreen)

                Spacer()

                if isPast {
                    Text("Abgeschlossen")
                        .font(.caption2)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 6)
                        .background(
                            Color.white.opacity(0.8)
                        )
                        .clipShape(
                            Capsule()
                        )
                }
            }

            HStack(spacing: 10) {

                Image(systemName: "calendar")
                    .foregroundColor(.yogaGold)

                Text(formattedDate(for: booking))
                    .foregroundColor(.gray)
            }

            HStack(spacing: 10) {

                Image(systemName: "clock.fill")
                    .foregroundColor(.yogaGold)

                Text(booking.course.time)
                    .foregroundColor(.gray)
            }

            if !isPast {

                HStack(spacing: 12) {

                    NavigationLink {

                        CourseDetailView(
                            courseID: booking.courseID,
                            role: .participant,
                            imageName:
                                course?.imageName
                                ?? booking.course.imageName,
                            title:
                                course?.title
                                ?? booking.course.title,
                            time:
                                booking.course.time,
                            duration:
                                course.map {
                                    "\($0.durationMinutes) Min."
                                } ?? "60 Min.",
                            level:
                                course?.displayLevel
                                ?? "Nicht angegeben",
                            trainer:
                                course?.trainerName
                                ?? "Kein Trainer zugeordnet",
                            room:
                                course?.room
                                ?? booking.course.room,
                            description:
                                course?.description
                                ?? "Keine Kursbeschreibung hinterlegt.",
                            participants:
                                course?.participantCount
                                ?? booking.course.participants,
                            maxParticipants:
                                course?.maxParticipants
                                ?? 15,
                            isBooked: true,
                            courseDate:
                                course?.startAt
                                ?? booking.course.date
                        )

                    } label: {

                        PrimaryButton(
                            title: "Details",
                            icon: "calendar"
                        )
                    }

                    Button {

                        bookingStore.errorMessage = nil
                        bookingToCancel = booking
                        showCancelConfirmation = true

                    } label: {

                        SecondaryButton(
                            title:
                                isCancelling
                                && bookingToCancel?.id
                                    == booking.id
                                    ? "Wird storniert ..."
                                    : "Stornieren",
                            icon: "xmark"
                        )
                    }
                    .disabled(isCancelling)
                    .opacity(
                        isCancelling ? 0.6 : 1
                    )
                }
            }
        }
        .padding()
        .background(
            Color.white.opacity(isPast ? 0.88 : 0.95)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(
                    Color.yogaGold.opacity(isPast ? 0.10 : 0.18),
                    lineWidth: 1
                )
        )
        .opacity(isPast ? 0.9 : 1)
        .clipShape(
            RoundedRectangle(
                cornerRadius: 24
            )
        )
        .opacity(isPast ? 0.82 : 1)
    }

    // MARK: - Cancel Selected Booking

    private func cancelSelectedBooking() {

        guard let booking = bookingToCancel else {
            return
        }

        isCancelling = true
        bookingStore.errorMessage = nil

        Task {

            let result = await bookingStore.cancel(
                booking: booking
            )

            isCancelling = false

            guard let result else {
                showCancelError = true
                return
            }

            cancellationRefunded =
                result.creditRefunded

            showCancelSuccess = true
        }
    }
}

// MARK: - Preview

#Preview {

    NavigationStack {

        MyBookingsView()
    }
    .environmentObject(BookingStore())
    .environmentObject(CourseStore())
    .environment(FavoritesStore())
}
