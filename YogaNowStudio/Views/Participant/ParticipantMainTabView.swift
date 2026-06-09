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

            ParticipantDashboardView()
                .tabItem {
                    Label(
                        "Heute",
                        systemImage: "house"
                    )
                }

            CalendarView()
                .tabItem {
                    Label(
                        "Buchen",
                        systemImage: "calendar"
                    )
                }

            MyBookingsView()
                .tabItem {
                    Label(
                        "Buchungen",
                        systemImage: "bookmark"
                    )
                }

            YogaLibraryView()
                .tabItem {
                    Label(
                        "Library",
                        systemImage: "book"
                    )
                }

            ProfileView(
                role: .participant
            )
            .tabItem {
                Label(
                    "Profil",
                    systemImage: "person"
                )
            }
        }
        .tint(.yogaGreen)
    }
}

#Preview {

    ParticipantMainTabView()
        .environment(FavoritesStore())
}
