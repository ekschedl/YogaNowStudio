//
//  SessionStore.swift
//  YogaNowStudio
//
//  Created by Kaaatkina on 16.06.26.
//

import Foundation
import Combine

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

    init(authService: AuthService) {
        self.authService = authService
    }

    init() {
        self.authService = AuthService()
    }

    // MARK: - User Role

    var userRole: UserRole? {
        profile?.role
    }

    // MARK: - Restore Session

    func restoreSession() async {

        isLoading = true
        errorMessage = nil

        defer {
            isLoading = false
        }

        do {

            profile = try await authService.loadCurrentProfile()
            email = authService.currentEmail

        } catch AuthServiceError.noActiveSession {

            clearSession()

        } catch AuthServiceError.expiredSession {

            clearSession()

        } catch {

            clearSession()

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

        clearSession()
    }

    // MARK: - Clear Session

    private func clearSession() {
        profile = nil
        email = nil
    }
}
