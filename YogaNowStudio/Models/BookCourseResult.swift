//
//  BookCourseResult.swift
//  YogaNowStudio
//
//  Created by Kaaatkina on 17.06.26.
//

import Foundation

struct BookCourseResult: Decodable {

    let bookingID: UUID
    let creditsRemaining: Int
    let participantsCount: Int

    enum CodingKeys: String, CodingKey {
        case bookingID = "booking_id"
        case creditsRemaining = "credits_remaining"
        case participantsCount = "participants_count"
    }
}
