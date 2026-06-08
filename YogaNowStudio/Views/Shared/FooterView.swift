import SwiftUI

enum FooterTab {
    case home
    case calendar
    case library
    case profile
}

struct FooterView: View {

    let selectedTab: FooterTab

    var body: some View {

        HStack {

            Spacer()

            NavigationLink {
                TrainerDashboardView()
            } label: {
                footerLabel(
                    icon: "house",
                    title: "Heute",
                    active: selectedTab == .home
                )
            }

            Spacer()

            NavigationLink {
                CalendarView()
            } label: {
                footerLabel(
                    icon: "calendar",
                    title: "Kalender",
                    active: selectedTab == .calendar
                )
            }

            Spacer()

            NavigationLink {
                YogaLibraryView()
            } label: {
                footerLabel(
                    icon: "book",
                    title: "Library",
                    active: selectedTab == .library
                )
            }

            Spacer()

            NavigationLink {
           
            } label: {
                footerLabel(
                    icon: "person",
                    title: "Profil",
                    active: selectedTab == .profile
                )
            }

            Spacer()
           }
        .padding(.vertical, 6)
        .frame(maxWidth: .infinity)
        .frame(height: 60)
        .background(Color.yogaCream)
        .shadow(
            color: .black.opacity(0.08),
            radius: 10,
            y: -2
        )

        .ignoresSafeArea(.container, edges: .bottom)
    }

    @ViewBuilder

    private func footerLabel(

        icon: String,

        title: String,

        active: Bool

    ) -> some View {

        VStack(spacing: 4) {

            Image(systemName: icon)

            Text(title)

                .font(.caption)

        }

        .foregroundColor(

            active ? .yogaGreen : .gray

        )

    }
}

#Preview {

    FooterView(
        selectedTab: .home
    )
}
