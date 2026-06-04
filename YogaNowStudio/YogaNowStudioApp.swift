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

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(favorites)
        }
    }
}
