//
//  YogaNowStudioApp.swift
//  YogaNowStudio
//
//  Created by Kaaatkina on 01.06.26.
//

import SwiftUI

@main
struct YogaNowStudioApp: App {
    @State private var favorites = FavoritesStore()
    @StateObject private var bookingStore = BookingStore()

    var body: some Scene {
        WindowGroup {
            WelcomeView()
                .environment(favorites)
                .environmentObject(bookingStore)
        }
    }
}
