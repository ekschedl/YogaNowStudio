//
//  Booking.swift
//  YogaNowStudio
//
//  Created by Kaaatkina on 12.06.26.
//

import Foundation

struct Booking: Identifiable, Equatable {

    let id: UUID
    let course: Course
    let bookingDate: Date

    init(
        id: UUID = UUID(),
        course: Course,
        bookingDate: Date = Date()
    ) {
        self.id = id
        self.course = course
        self.bookingDate = bookingDate
    }
}
