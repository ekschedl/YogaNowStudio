//
//  SupabaseCourse.swift
//  YogaNowStudio
//
//  Created by Kaaatkina on 17.06.26.
//

import Foundation

struct SupabaseCourse: Codable, Identifiable {

    let id: UUID
    let trainerId: UUID?
    let title: String
    let description: String?
    let startAt: Date
    let durationMinutes: Int
    let room: String?
    let level: String?
    let maxParticipants: Int
    let imageName: String?
    let createdAt: Date

    var participantCount: Int = 0

    enum CodingKeys: String, CodingKey {
        case id
        case trainerId = "trainer_id"
        case title
        case description
        case startAt = "start_at"
        case durationMinutes = "duration_minutes"
        case room
        case level
        case maxParticipants = "max_participants"
        case imageName = "image_name"
        case createdAt = "created_at"
    }
}
