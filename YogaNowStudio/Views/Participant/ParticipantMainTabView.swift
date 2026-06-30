import SwiftUI

enum ParticipantTab {
    case dashboard
    case calendar
    case bookings
    case library
    case profile
}

struct ParticipantMainTabView: View {

    @State private var selectedTab: ParticipantTab = .dashboard

    @State private var dashboardPath = NavigationPath()
    @State private var calendarPath = NavigationPath()
    @State private var bookingsPath = NavigationPath()
    @State private var libraryPath = NavigationPath()
    @State private var profilePath = NavigationPath()

    private var tabSelection: Binding<ParticipantTab> {
        Binding(
            get: {
                selectedTab
            },
            set: { newValue in

                selectedTab = newValue

                if newValue == .dashboard {
                    dashboardPath = NavigationPath()
                }

                if newValue == .calendar {
                    calendarPath = NavigationPath()
                }

                if newValue == .bookings {
                    bookingsPath = NavigationPath()
                }

                if newValue == .library {
                    libraryPath = NavigationPath()
                }

                if newValue == .profile {
                    profilePath = NavigationPath()
                }
            }
        )
    }

    var body: some View {

        TabView(selection: tabSelection) {

            NavigationStack(path: $dashboardPath) {

                ParticipantDashboardView(
              
                )
            }
            .tabItem {
                Label("Heute", systemImage: "house")
            }
            .tag(ParticipantTab.dashboard)

            NavigationStack(path: $calendarPath) {

                CalendarView(
                    role: .participant,
                    onBookingFinished: {
                          selectedTab = .bookings
                      }                )
            }
            .tabItem {
                Label("Kalender", systemImage: "calendar")
            }
            .tag(ParticipantTab.calendar)

            NavigationStack(path: $bookingsPath) {

                MyBookingsView()
            }
            .tabItem {
                Label("Buchungen", systemImage: "bookmark")
            }
            .tag(ParticipantTab.bookings)

            NavigationStack(path: $libraryPath) {

                YogaLibraryView()
            }
            .tabItem {
                Label("Library", systemImage: "book")
            }
            .tag(ParticipantTab.library)

            NavigationStack(path: $profilePath) {

                ProfileView(role: .participant)
            }
            .tabItem {
                Label("Profil", systemImage: "person")
            }
            .tag(ParticipantTab.profile)
        }
        .tint(.yogaGold)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ParticipantMainTabView()
        .environment(FavoritesStore())
        .environmentObject(BookingStore())
        .environmentObject(CourseStore())
        .environmentObject(SessionStore())
}
