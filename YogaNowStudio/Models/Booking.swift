//
//  Booking.swift
//  YogaNowStudio
//
//  Created by Kaaatkina on 12.06.26.
//

import Foundation

struct Booking: Identifiable, Equatable {

    let id: UUID
    let courseID: UUID
    let course: Course
    let bookingDate: Date

    init(
        id: UUID = UUID(),
        courseID: UUID,
        course: Course,
        bookingDate: Date = Date()
    ) {
        self.id = id
        self.courseID = courseID
        self.course = course
        self.bookingDate = bookingDate
    }
}
