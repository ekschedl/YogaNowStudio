//
//  MainTabView..swift
//  YogaNowStudio
//
//  Created by Kaaatkina on 09.06.26.
//
import SwiftUI

struct TrainerMainTabView: View {
    
    var body: some View {
        
        TabView {
            
            NavigationStack {
                TrainerDashboardView()
            }
            .tabItem {
                Label(
                    "Heute",
                    systemImage: "house"
                )
            }
            
            CalendarView(
                role: .trainer
            )
            .tabItem {
                Label(
                    "Kalender",
                    systemImage: "calendar"
                )
            }
            
            NavigationStack {
                
                YogaLibraryView()
                
            }
            .tabItem {
                Label(
                    "Library",
                    systemImage: "book"
                )
            }
            
            NavigationStack {

                ProfileView(

                    role: .trainer

                )

            }

            .tabItem {

                Label(

                    "Profil",

                    systemImage: "person"

                )

            }
        }
    }
}
