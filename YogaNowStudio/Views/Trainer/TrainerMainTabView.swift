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
            
            NavigationStack {
                CalendarView(
                    role: .trainer
                )
            }
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
            
        }.tint(.yogaGold)
    }
}
#Preview {

    NavigationStack {

        CalendarView(
            role: .participant,
            onBookingFinished: {}
        )
    }
    .environmentObject(BookingStore())
    .environmentObject(SessionStore())
    .environmentObject(CourseStore())
    .environment(FavoritesStore())
}
