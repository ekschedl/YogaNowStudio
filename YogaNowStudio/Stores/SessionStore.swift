//
//  SessionStore.swift
//  YogaNowStudio
//
//  Created by Kaaatkina on 16.06.26.
//

import Foundation
import Combine

// MARK: - Session Store

@MainActor
final class SessionStore: ObservableObject {

    // MARK: - Published Properties

    @Published private(set) var profile: AppProfile?
    @Published private(set) var email: String?
    @Published private(set) var isLoading = true
    @Published private(set) var errorMessage: String?

    // MARK: - Properties

    private let authService: AuthService

    // MARK: - Initialization

    init(
        authService: AuthService = AuthService()
    ) {
        self.authService = authService
    }

    // MARK: - Computed Properties

    var userRole: UserRole? {

        guard let role = profile?.role else {
            return nil
        }

        let normalizedRole = role
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .lowercased()

        return UserRole(rawValue: normalizedRole)
    }

    // MARK: - Restore Session

    func restoreSession() async {

        isLoading = true
        errorMessage = nil

        defer {
            isLoading = false
        }

        do {

            let loadedProfile =
                try await authService.loadCurrentProfile()

            let normalizedRole = loadedProfile.role
                .trimmingCharacters(in: .whitespacesAndNewlines)
                .lowercased()

            guard UserRole(rawValue: normalizedRole) != nil else {

                try? await authService.signOut()

                profile = nil
                email = nil
                errorMessage =
                    "Für dieses Benutzerkonto wurde keine gültige Rolle gefunden."

                return
            }

            profile = loadedProfile
            email = authService.currentEmail

        } catch AuthServiceError.noActiveSession {

            profile = nil
            email = nil

        } catch {

            profile = nil
            email = nil
            errorMessage =
                "Die gespeicherte Anmeldung konnte nicht geladen werden."
        }
    }

    // MARK: - Sign In

    func signIn(
        email: String,
        password: String
    ) async throws {

        errorMessage = nil

        let loadedProfile = try await authService.signIn(
            email: email,
            password: password
        )

        let normalizedRole = loadedProfile.role
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .lowercased()

        guard UserRole(rawValue: normalizedRole) != nil else {

            try? await authService.signOut()

            profile = nil
            self.email = nil

            throw AuthServiceError.invalidRole
        }

        profile = loadedProfile
        self.email = authService.currentEmail
    }

    // MARK: - Sign Out

    func signOut() async {

        errorMessage = nil

        do {

            try await authService.signOut()

        } catch {

            errorMessage =
                "Die Abmeldung konnte nicht abgeschlossen werden."
        }

        profile = nil
        email = nil
    }
}
