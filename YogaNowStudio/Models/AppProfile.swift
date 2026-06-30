//
//  AppProfile.swift
//  YogaNowStudio
//
//  Created by Kaaatkina on 16.06.26.



import Foundation

struct AppProfile: Codable, Identifiable {

    let id: UUID

    let displayName: String
    let firstName: String?
    let lastName: String?

    let role: UserRole
    let credits: Int

    let memberSince: String?
    let trainerSince: String?
    let yogaStyle: String?
    let experienceYears: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case displayName = "display_name"
        case firstName = "first_name"
        case lastName = "last_name"
        case role
        case credits
        case memberSince = "member_since"
        case trainerSince = "trainer_since"
        case yogaStyle = "yoga_style"
        case experienceYears = "experience_years"
    }

    // Nur Vorname für Begrüßung

    var greetingName: String {

        let cleanedFirstName =
            firstName?
                .trimmingCharacters(
                    in: .whitespacesAndNewlines
                )

        if let cleanedFirstName,
           !cleanedFirstName.isEmpty {
            return cleanedFirstName
        }

        return displayName
    }

    // Vorname + Nachname für persönliche Daten

    var fullName: String {

        let names = [
            firstName,
            lastName
        ]
        .compactMap { name in
            name?.trimmingCharacters(
                in: .whitespacesAndNewlines
            )
        }
        .filter {
            !$0.isEmpty
        }

        return names.isEmpty
            ? displayName
            : names.joined(separator: " ")
    }
}
