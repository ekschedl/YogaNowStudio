import Foundation
import SwiftUI
import Combine

@MainActor
final class BookingStore: ObservableObject {

    // MARK: - Published Properties
    @Published var courseParticipants: [CourseParticipant] = []
    @Published var isLoadingParticipants = false
    @Published var participantsErrorMessage: String?
    
    @Published private(set) var bookings: [Booking] = []
    @Published private(set) var credits: Int = 0
    @Published var errorMessage: String?

    // MARK: - Service

    private let bookingService: BookingService

    // MARK: - Init

    init() {
        self.bookingService = SupabaseBookingService()
    }

    init(
        bookingService: BookingService
    ) {
        self.bookingService = bookingService
    }

    // MARK: - Load Bookings

    func loadBookings() async {

        do {
            bookings = try await bookingService.fetchBookings()
            errorMessage = nil

        } catch {
            errorMessage = "Buchungen konnten nicht geladen werden."
        }
    }

    // MARK: - Set Credits

    func setCredits(_ value: Int) {
        credits = value
    }
    
    // MARK: - Book Course

    func book(
        courseID: UUID,
        course: Course
    ) async -> Bool {

        errorMessage = nil

        do {

            let result = try await bookingService.bookCourse(
                courseID: courseID
            )

            let booking = Booking(
                id: result.bookingID,
                courseID: courseID,
                course: course
            )

            bookings.append(booking)

            credits = result.creditsRemaining

            return true

        } catch {

            errorMessage = bookingErrorMessage(
                from: error
            )

            return false
        }
    }
    // MARK: - Reset

    func reset() {
        bookings = []
        credits = 0
        courseParticipants = []
        errorMessage = nil
        participantsErrorMessage = nil
        isLoadingParticipants = false
    }
    
    // MARK: - Cancel Booking
    func cancel(
        booking: Booking
    ) async -> CancelBookingResult? {

        do {

            let result = try await bookingService.cancelBooking(
                bookingID: booking.id
            )

            bookings.removeAll {
                $0.id == booking.id
            }

            credits = result.creditsRemaining
            errorMessage = nil

            return result

        } catch {

            let message = error.localizedDescription

            if message.contains("nicht gefunden") {
                errorMessage = "Die Buchung wurde nicht gefunden."
            } else {
                errorMessage = "Die Buchung konnte nicht storniert werden."
            }

            return nil
        }
    }

    // MARK: - Booking Check

    func isBooked(
        courseID: UUID
    ) -> Bool {
        bookings.contains { booking in
            booking.courseID == courseID
        }
    }
//
    @MainActor
    func loadParticipants(
        for courseID: UUID
    ) async {

        isLoadingParticipants = true
        participantsErrorMessage = nil
        courseParticipants = []

        do {

            courseParticipants =
                try await bookingService.fetchParticipants(
                    for: courseID
                )

        } catch {

            print("❌ Teilnehmer laden Fehler:", error.localizedDescription)

            participantsErrorMessage =
                "Teilnehmer konnten nicht geladen werden."
        }

        isLoadingParticipants = false
    }
    // MARK: - Error Message

    private func bookingErrorMessage(
        from error: Error
    ) -> String {

        let message = error.localizedDescription

        if message.contains("bereits gebucht") {
            return "Du hast diesen Kurs bereits gebucht."
        }

        if message.contains("nicht genügend Credits") {
            return "Du hast keine verfügbaren Credits mehr."
        }

        if message.contains("ausgebucht") {
            return "Dieser Kurs ist bereits ausgebucht."
        }

        if message.contains("nicht gefunden") {
            return "Der Kurs wurde nicht gefunden."
        }

        if message.contains("Nur Teilnehmer") {
            return "Nur Teilnehmer können Kurse buchen."
        }

        return "Der Kurs konnte nicht gebucht werden."
    }
}
