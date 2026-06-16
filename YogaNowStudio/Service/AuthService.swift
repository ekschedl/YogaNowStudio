//
//  AuthService.swift
//  YogaNowStudio
//
//  Created by Kaaatkina on 16.06.26.
//


import Foundation
import Supabase

// MARK: - Authentication Service

final class AuthService {

    // MARK: - Properties

    private let client = SupabaseManager.client

    // MARK: - Sign In

    func signIn(
        email: String,
        password: String
    ) async throws -> AppProfile {

        let session = try await client.auth.signIn(
            email: email,
            password: password
        )

        return try await loadProfile(
            userID: session.user.id
        )
    }

    // MARK: - Load Current Profile

    func loadCurrentProfile() async throws -> AppProfile {

        guard let session = client.auth.currentSession else {
            throw AuthServiceError.noActiveSession
        }

        return try await loadProfile(
            userID: session.user.id
        )
    }

    // MARK: - Load Profile

    private func loadProfile(
        userID: UUID
    ) async throws -> AppProfile {

        let profile: AppProfile = try await client
            .from("profiles")
            .select()
            .eq("id", value: userID)
            .single()
            .execute()
            .value

        return profile
    }

    // MARK: - Current Email

    var currentEmail: String? {
        client.auth.currentSession?.user.email
    }

    // MARK: - Sign Out

    func signOut() async throws {
        try await client.auth.signOut()
    }
}

// MARK: - Authentication Service Error

enum AuthServiceError: LocalizedError {

    case noActiveSession
    case invalidRole

    var errorDescription: String? {

        switch self {

        case .noActiveSession:
            return "Es ist keine aktive Anmeldung vorhanden."

        case .invalidRole:
            return "Für dieses Benutzerkonto wurde keine gültige Rolle gefunden."
        }
    }
}
