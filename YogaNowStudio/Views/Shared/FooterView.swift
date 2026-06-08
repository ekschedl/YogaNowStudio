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

            if selectedTab == .home {

                footerLabel(
                    icon: "house",
                    title: "Heute",
                    active: true
                )

            } else {

                NavigationLink {
                    TrainerDashboardView()
                } label: {
                    footerLabel(
                        icon: "house",
                        title: "Heute",
                        active: false
                    )
                }
            }

            Spacer()

            if selectedTab == .calendar {

                footerLabel(
                    icon: "calendar",
                    title: "Kalender",
                    active: true
                )

            } else {

                NavigationLink {
                    CalendarView()
                } label: {
                    footerLabel(
                        icon: "calendar",
                        title: "Kalender",
                        active: false
                    )
                }
            }

            Spacer()

            if selectedTab == .library {

                footerLabel(
                    icon: "book",
                    title: "Library",
                    active: true
                )

            } else {

                NavigationLink {
                    YogaLibraryView()
                } label: {
                    footerLabel(
                        icon: "book",
                        title: "Library",
                        active: false
                    )
                }
            }

            Spacer()

            if selectedTab == .profile {

                footerLabel(
                    icon: "person",
                    title: "Profil",
                    active: true
                )

            } else {

                NavigationLink {
                    Text("Profil")
                } label: {
                    footerLabel(
                        icon: "person",
                        title: "Profil",
                        active: false
                    )
                }
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
            active
            ? .yogaGreen
            : .gray
        )
    }
}

#Preview {

    NavigationStack {

        FooterView(
            selectedTab: .home
        ).environment(FavoritesStore())
    }
}
