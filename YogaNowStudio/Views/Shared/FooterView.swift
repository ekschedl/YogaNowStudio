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

            footerItem(
                icon: "house",
                title: "Heute",
                active: selectedTab == .home
            )

            Spacer()

            footerItem(
                icon: "calendar",
                title: "Kalender",
                active: selectedTab == .calendar
            )

            Spacer()

            footerItem(
                icon: "book",
                title: "Library",
                active: selectedTab == .library
            )

            Spacer()

            footerItem(
                icon: "person",
                title: "Profil",
                active: selectedTab == .profile
            )

            Spacer()
        }
        .padding(.top, 12)
        .padding(.bottom, 12)
        .frame(maxWidth: .infinity)
        .background(Color.yogaCream)
        .shadow(
            color: .black.opacity(0.08),
            radius: 10,
            y: -2
        )
    }

    @ViewBuilder
    private func footerItem(
        icon: String,
        title: String,
        active: Bool
    ) -> some View {

        Button {

        } label: {

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
}

#Preview {

    FooterView(
        selectedTab: .home
    )
}
