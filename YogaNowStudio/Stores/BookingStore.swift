import Foundation
import SwiftUI
import Combine

@MainActor
final class BookingStore: ObservableObject {

    @Published private(set) var bookings: [Booking] = []
    @Published private(set) var credits: Int = 8
    @Published var errorMessage: String?

    private let bookingService: BookingService

    init() {
        self.bookingService = MockBookingService()
    }

    init(
        bookingService: BookingService
    ) {
        self.bookingService = bookingService
    }

    func loadBookings() async {
        do {
            bookings = try await bookingService.fetchBookings()
        } catch {
            errorMessage = "Buchungen konnten nicht geladen werden."
        }
    }

    func book(
        course: Course
    ) async -> Bool {

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

            return true

        } catch {
            errorMessage = "Der Kurs konnte nicht gebucht werden."
            return false
        }
    }

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

        } catch {
            errorMessage = "Die Buchung konnte nicht storniert werden."
        }
    }

    func isBooked(
        course: Course
    ) -> Bool {

        bookings.contains {
            $0.course.id == course.id
        }
    }
}
