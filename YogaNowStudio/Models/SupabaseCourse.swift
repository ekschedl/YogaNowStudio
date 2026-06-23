//
//  SupabaseCourse.swift
//  YogaNowStudio
//
//  Created by Kaaatkina on 17.06.26.
//

import Foundation

// MARK: - Trainer Profile

struct CourseTrainerProfile: Codable {

    let id: UUID
    let displayName: String

    enum CodingKeys: String, CodingKey {
        case id
        case displayName = "display_name"
    }
}

// MARK: - Supabase Course

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

    // Wird durch die Relation zu profiles geladen
    let trainerProfile: CourseTrainerProfile?

    // Wird nach dem Laden aus den Buchungen gesetzt
    var participantCount: Int = 0

    // MARK: - Display Values

    var trainerName: String {
        trainerProfile?.displayName ?? "Kein Trainer zugeordnet"
    }

    var displayLevel: String {
        level ?? "Nicht angegeben"
    }

    // MARK: - Coding Keys

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
        case trainerProfile = "trainer_profile"
    }
}
