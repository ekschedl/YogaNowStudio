//
//  AppProfile.swift
//  YogaNowStudio
//
//  Created by Kaaatkina on 16.06.26.
//

import Foundation

// MARK: - App Profile

struct AppProfile: Codable, Identifiable {

    let id: UUID
    let displayName: String
    let role: String
    let credits: Int
    let memberSince: String?
    let trainerSince: String?
    let yogaStyle: String?
    let experienceYears: Int?

    // MARK: - Coding Keys

    enum CodingKeys: String, CodingKey {
        case id
        case displayName = "display_name"
        case role
        case credits
        case memberSince = "member_since"
        case trainerSince = "trainer_since"
        case yogaStyle = "yoga_style"
        case experienceYears = "experience_years"
    }
}
