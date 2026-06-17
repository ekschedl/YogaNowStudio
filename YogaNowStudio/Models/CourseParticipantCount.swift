//
//  CourseParticipantCount.swift
//  YogaNowStudio
//
//  Created by Kaaatkina on 17.06.26.
//

import Foundation

struct CourseParticipantCount: Decodable {

    let courseID: UUID
    let participantCount: Int

    enum CodingKeys: String, CodingKey {
        case courseID = "course_id"
        case participantCount = "participant_count"
    }
}
