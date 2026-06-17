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
        courseID: UUID
    ) async throws -> BookCourseResult

    func cancelBooking(
        booking: Booking
    ) async throws
}
