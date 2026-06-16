//
//  YogaNowStudioApp.swift
//  YogaNowStudio
//
//  Created by Kaaatkina on 01.06.26.
//
import SwiftUI

@main
struct YogaNowStudioApp: App {

    // MARK: - Stores

    @State private var favorites = FavoritesStore()

    @StateObject private var bookingStore = BookingStore()
    @StateObject private var sessionStore = SessionStore()

    // MARK: - Body

    var body: some Scene {

        WindowGroup {

            AppRootView()
                .environment(favorites)
                .environmentObject(bookingStore)
                .environmentObject(sessionStore)
        }
    }
}
