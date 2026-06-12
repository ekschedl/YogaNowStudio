//
//  MockBookingService.swift
//  YogaNowStudio
//
//  Created by Kaaatkina on 12.06.26.
//

import Foundation

final class MockBookingService: BookingService {

    private var bookings: [Booking] = []

    func fetchBookings() async throws -> [Booking] {
        bookings
    }

    func bookCourse(
        course: Course
    ) async throws -> Booking {

        let booking = Booking(course: course)
        bookings.append(booking)

        return booking
    }

    func cancelBooking(
        booking: Booking
    ) async throws {

        bookings.removeAll {
            $0.id == booking.id
        }
    }
}
