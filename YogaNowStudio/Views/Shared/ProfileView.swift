import SwiftUI

struct ProfileView: View {

    // MARK: - Environment

    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var bookingStore: BookingStore

    // MARK: - Properties

    let role: UserRole

    // MARK: - Computed Properties

    private var userName: String {
        role == .trainer ? "Valerie" : "Katja"
    }

    private var userEmail: String {
        role == .trainer ? "valerie@yoganow.at" : "katja@test.at"
    }

    private var roleTitle: String {
        role == .trainer ? "YOGA TRAINERIN" : "TEILNEHMERIN"
    }

    private var studioName: String {
        "YogaNow Graz"
    }

    private var memberTitle: String {
        role == .trainer ? "TRAINER SEIT" : "MITGLIED SEIT"
    }

    private var memberValue: String {
        role == .trainer ? "2024" : "Juni 2026"
    }

    // MARK: - Body

    var body: some View {

        ZStack {

            Image("BackgroundYoga")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            ScrollView(showsIndicators: false) {

                VStack(spacing: 32) {
                    headerSection
                    roleInfoSection
                    personalDataSection
                    logoutButton
                    Spacer()
                        .frame(height: 100)
                }
                .padding(.horizontal)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }

    // MARK: - Header Section

    private var headerSection: some View {

        VStack(spacing: 8) {

            Text("Namasté")
                .font(.title3)
                .foregroundColor(.yogaGreen)

            Text(userName)
                .font(
                    .system(
                        size: 44,
                        weight: .semibold,
                        design: .serif
                    )
                )
                .tracking(2)
                .foregroundColor(.yogaGold)

            Text(roleTitle)
                .font(.caption)
                .fontWeight(.bold)
                .tracking(4)
                .foregroundColor(.yogaGreen.opacity(0.75))
        }
        .padding(.top, 70)
    }

    // MARK: - Role Info Section

    @ViewBuilder
    private var roleInfoSection: some View {

        if role == .participant {

            VStack(spacing: 20) {
                
                VStack(spacing: 6) {
                    Text("CREDITS")
                        .font(.caption)
                        .fontWeight(.bold)
                        .tracking(4)
                        .foregroundColor(.yogaGold)

                    Text("\(bookingStore.credits)")
                        .font(
                            .system(
                                size: 48,
                                weight: .bold,
                                design: .serif
                            )
                        )
                        .foregroundColor(.yogaGreen)
                }

                HStack(spacing: 20) {
                    profileSmallCard(
                        title: "LEVEL",
                        value: "Alle Levels"
                    )
                    profileSmallCard(
                        title: "BUCHUNGEN",
                        value: "\(bookingStore.bookings.count)"
                    )
                }
            }

        } else {

            VStack(spacing: 20) {

                Text("schön, dass du da bist")
                    .font(.caption)
                    .fontWeight(.bold)
                    .tracking(4)
                    .foregroundColor(.yogaGold)

                HStack(spacing: 20) {

                    profileSmallCard(
                        title: "STIL",
                        value: "Vinyasa & Yin"
                    )

                    profileSmallCard(
                        title: "ERFAHRUNG",
                        value: "6 Jahre"
                    )
                }
            }
        }
    }

    // MARK: - Personal Data Section

    private var personalDataSection: some View {

        VStack(
            alignment: .leading,
            spacing: 24
        ) {

            Text("PERSÖNLICHE DATEN")
                .font(.caption)
                .fontWeight(.bold)
                .tracking(4)
                .foregroundColor(.yogaGold)

            profileDataRow(
                title: "NAME",
                value: userName
            )

            profileDataRow(
                title: "E-MAIL",
                value: userEmail
            )

            profileDataRow(
                title: "ROLLE",
                value: role == .trainer ? "Trainerin" : "Teilnehmerin"
            )

            profileDataRow(
                title: "STUDIO",
                value: studioName
            )

            profileDataRow(
                title: memberTitle,
                value: memberValue
            )
        }
        .frame(
            maxWidth: .infinity,
            alignment: .leading
        )
        .padding(24)
        .background(
            LinearGradient(
                colors: [
                    Color.white.opacity(0.92),
                    Color.yogaCream.opacity(0.86)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .clipShape(
            RoundedRectangle(
                cornerRadius: 28
            )
        )
    }

    // MARK: - Small Profile Card

    private func profileSmallCard(
        title: String,
        value: String
    ) -> some View {

        VStack(spacing: 6) {

            Text(title)
                .font(.caption)
                .fontWeight(.bold)
                .tracking(3)
                .foregroundColor(.yogaGold)

            Text(value)
                .fontWeight(.semibold)
                .foregroundColor(.yogaGreen)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        
       
    }

    // MARK: - Profile Data Row

    private func profileDataRow(
        title: String,
        value: String
    ) -> some View {

        VStack(
            alignment: .leading,
            spacing: 2
        ) {

            Text(title)
                .font(.caption)
                .fontWeight(.bold)
                .tracking(2)
                .foregroundColor(.yogaGold)

            Text(value)
                .foregroundColor(.yogaGreen)
        }
    }

    // MARK: - Logout Button

    private var logoutButton: some View {

        Button {
            dismiss()
        } label: {
            SecondaryButton(
                title: "Abmelden",
                icon: "rectangle.portrait.and.arrow.right"
            )
        }
    }
}

// MARK: - Preview

#Preview("Teilnehmer") {

    NavigationStack {

        ProfileView(
            role: .participant
        )
    }
    .environmentObject(BookingStore())
    .environment(FavoritesStore())
}

#Preview("Trainer") {

    NavigationStack {

        ProfileView(
            role: .trainer
        )
    }
    .environmentObject(BookingStore())
    .environment(FavoritesStore())
}
