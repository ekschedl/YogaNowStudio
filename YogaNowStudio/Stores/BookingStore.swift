import Foundation
import SwiftUI
import Combine

@MainActor
final class BookingStore: ObservableObject {

    // MARK: - Published Properties

    @Published private(set) var bookings: [Booking] = []
    @Published private(set) var credits: Int = 8
    @Published var errorMessage: String?

    // MARK: - Service

    private let bookingService: BookingService

    // MARK: - Init

    init() {
        self.bookingService = MockBookingService()
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

    // MARK: - Book Course

    func book(
        course: Course
    ) async -> Bool {

        let alreadyBooked = bookings.contains { booking in

            booking.course.title == course.title &&
            Calendar.current.isDate(
                booking.course.date,
                inSameDayAs: course.date
            )
        }

        if alreadyBooked {
            errorMessage = "Du hast diesen Kurs bereits gebucht."
            return false
        }

        guard credits > 0 else {
            errorMessage = "Du hast nicht genügend Credits."
            return false
        }

        do {
            let booking = try await bookingService.bookCourse(
                course: course
            )

            bookings.append(booking)
            credits -= 1
            errorMessage = nil

            return true

        } catch {
            errorMessage = "Der Kurs konnte nicht gebucht werden."
            return false
        }
    }

    // MARK: - Cancel Booking

    func cancel(
        booking: Booking
    ) async {

        do {
            try await bookingService.cancelBooking(
                booking: booking
            )

            bookings.removeAll {
                $0.id == booking.id
            }

            credits += 1
            errorMessage = nil

        } catch {
            errorMessage = "Die Buchung konnte nicht storniert werden."
        }
    }

    // MARK: - Booking Check

    func isBooked(
        course: Course
    ) -> Bool {

        bookings.contains { booking in

            booking.course.title == course.title &&
            Calendar.current.isDate(
                booking.course.date,
                inSameDayAs: course.date
            )
        }
    }
}
