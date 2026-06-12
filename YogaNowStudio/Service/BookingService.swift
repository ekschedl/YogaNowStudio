//
//  BookingService.swift
//  YogaNowStudio
//
//  Created by Kaaatkina on 12.06.26.
//

import Foundation

protocol BookingService {

    func fetchBookings() async throws -> [Booking]

    func bookCourse(
        course: Course
    ) async throws -> Booking

    func cancelBooking(
        booking: Booking
    ) async throws
}
