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

        switch profile?.role.lowercased() {

        case "participant":
            return .participant

        case "trainer":
            return .trainer

        default:
            return nil
        }
    }

    // MARK: - Restore Session

    func restoreSession() async {

        isLoading = true
        errorMessage = nil

        do {

            profile = try await authService.loadCurrentProfile()
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

        isLoading = false
    }

    // MARK: - Sign In

    func signIn(
        email: String,
        password: String
    ) async throws {

        let loadedProfile = try await authService.signIn(
            email: email,
            password: password
        )

        let normalizedRole = loadedProfile.role.lowercased()

        guard normalizedRole == "participant"
                || normalizedRole == "trainer" else {

            try? await authService.signOut()
            throw AuthServiceError.invalidRole
        }

        profile = loadedProfile
        self.email = authService.currentEmail
        errorMessage = nil
    }

    // MARK: - Sign Out

    func signOut() async {

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
