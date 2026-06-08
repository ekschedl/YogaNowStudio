//
//  YogaNowStudioApp.swift
//  YogaNowStudio
//
//  Created by Kaaatkina on 01.06.26.
//

import SwiftUI

@main
struct YogaNowStudioApp: App {

    @State private var favoritesStore = FavoritesStore()

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                LoginView()
            }
            .environment(favoritesStore)
        }
    }
}
