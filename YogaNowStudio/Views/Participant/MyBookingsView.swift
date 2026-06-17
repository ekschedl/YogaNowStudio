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

    // MARK: - State

    @State private var bookingToCancel: Booking?
    @State private var showCancelConfirmation = false
    @State private var showCancelSuccess = false
    @State private var showCancelError = false
    @State private var cancellationRefunded = false
    @State private var isCancelling = false

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

                VStack(spacing: 24) {

                    headerSection

                    if bookingStore.bookings.isEmpty {
                        emptyState
                    } else {
                        bookingsSection
                    }

                    Spacer()
                        .frame(height: 100)
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
    }

    // MARK: - Header

    private var headerSection: some View {

        VStack(spacing: 8) {

            Spacer()
            Spacer()

            Text("Meine Buchungen")
                .font(
                    .system(
                        size: 30,
                        weight: .semibold,
                        design: .serif
                    )
                )
                .foregroundColor(.yogaGreen)

            Text(
                "\(bookingStore.bookings.count) AKTIVE KURSE"
            )
            .font(.caption)
            .fontWeight(.bold)
            .tracking(3)
            .foregroundColor(.yogaGold)
        }
        .padding(.top, 80)
    }

    // MARK: - Empty State

    private var emptyState: some View {

        VStack(spacing: 16) {

            Image(
                systemName:
                    "calendar.badge.exclamationmark"
            )
            .font(.system(size: 38))
            .foregroundColor(.yogaGold)

            Text("Keine Buchungen")
                .font(
                    .system(
                        size: 28,
                        weight: .semibold,
                        design: .serif
                    )
                )
                .foregroundColor(.yogaGreen)

            Text(
                "Du hast aktuell keine aktiven Kurse gebucht."
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

        ForEach(bookingStore.bookings) { booking in

            bookingCard(
                booking: booking
            )
        }
    }

    // MARK: - Booking Card

    private func bookingCard(
        booking: Booking
    ) -> some View {

        VStack(
            alignment: .leading,
            spacing: 14
        ) {

            Text(booking.course.title)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.yogaGreen)

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

            HStack(spacing: 12) {

                NavigationLink {

                    CourseDetailView(
                        courseID: booking.courseID,
                        role: .participant,
                        imageName:
                            booking.course.imageName,
                        title:
                            booking.course.title,
                        time:
                            booking.course.time,
                        duration: "60 Min.",
                        level: "Alle Levels",
                        trainer: "Laura",
                        room:
                            booking.course.room,
                        description:
                            "Kursbeschreibung",
                        participants:
                            booking.course.participants,
                        maxParticipants: 15,
                        isBooked: true,
                        onShowBookings: {},
                        courseDate:
                            booking.course.date
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
        .padding()
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
            RoundedRectangle(
                cornerRadius: 24
            )
        )
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
    .environment(FavoritesStore())
}
