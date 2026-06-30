//
//  CourseParticipant.swift
//  YogaNowStudio
//
//  Created by Kaaatkina on 26.06.26.
//

import Foundation

struct CourseParticipant: Codable, Identifiable {

    let id: UUID
    let displayName: String
    let firstName: String?
    let lastName: String?

    enum CodingKeys: String, CodingKey {
        case id
        case displayName = "display_name"
        case firstName = "first_name"
        case lastName = "last_name"
    }

    var fullName: String {

        let names = [
            firstName,
            lastName
        ]
        .compactMap {
            $0?.trimmingCharacters(
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
