//
//  ParticipantMainTabView.swift
//  YogaNowStudio
//
//  Created by Kaaatkina on 09.06.26.
//

import SwiftUI

struct ParticipantMainTabView: View {

    var body: some View {

        TabView {

            NavigationStack {
                ParticipantDashboardView()
            }
            .tabItem {
                Label("Heute", systemImage: "house")
            }

            CalendarView(
                role: .participant
            )
            .tabItem {
                Label("Kalender", systemImage: "calendar")
            }

            NavigationStack {
                MyBookingsView()
            }
            .tabItem {
                Label("Buchungen", systemImage: "bookmark")
            }

            NavigationStack {
                YogaLibraryView()
            }
            .tabItem {
                Label("Library", systemImage: "book")
            }

            NavigationStack {
                ProfileView(role: .participant)
            }
            .tabItem {
                Label("Profil", systemImage: "person")
            }
        }
        .tint(.yogaGreen)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {

    ParticipantMainTabView()
        .environment(FavoritesStore())
}
