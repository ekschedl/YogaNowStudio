//
//  CourseParticipant.swift
//  YogaNowStudio
//
//  Created by Kaaatkina on 26.06.26.
//

import Foundation

struct CourseParticipant: Identifiable, Decodable {

    let id: UUID
    let displayName: String

    enum CodingKeys: String, CodingKey {
        case id
        case displayName = "display_name"
    }
}
