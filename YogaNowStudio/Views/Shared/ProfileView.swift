import SwiftUI

struct ProfileView: View {

    // MARK: - Environment

    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var bookingStore: BookingStore
    @EnvironmentObject private var sessionStore: SessionStore

    // MARK: - Properties

    let role: UserRole

    // MARK: - User Information

    private var userName: String {
        role == .trainer ? "Valerie" : "Katja"
    }

    private var userEmail: String {
        role == .trainer
            ? "valerie@yoganow.at"
            : "katja@test.at"
    }

    private var roleTitle: String {
        role == .trainer
            ? "YOGA TRAINERIN"
            : "TEILNEHMERIN"
    }

    private var roleValue: String {
        role == .trainer
            ? "Trainerin"
            : "Teilnehmerin"
    }

    private var greetingText: String {
        role == .trainer
            ? "Atme ein. Inspiriere."
            : "Atme ein. Komm bei dir an."
    }

    private var memberTitle: String {
        role == .trainer
            ? "TRAINER SEIT"
            : "MITGLIED SEIT"
    }

    private var memberValue: String {
        role == .trainer
            ? "2024"
            : "Juni 2026"
    }

    // MARK: - Body

    var body: some View {

        ZStack {

            Image("BackgroundYoga")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            ScrollView(showsIndicators: false) {

                VStack(spacing: 26) {

                    headerSection

                    roleInfoSection

                    personalDataSection

                    logoutButton

                    Spacer()
                        .frame(height: 110)
                }
                .padding(.horizontal, 22)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }

    // MARK: - Header Section

    private var headerSection: some View {

        VStack(spacing: 7) {

            Text("Namasté")
                .font(
                    .system(
                        size: 21,
                        weight: .regular,
                        design: .rounded
                    )
                )
                .foregroundColor(.yogaGreen)

            Text(userName)
                .font(
                    .system(
                        size: 48,
                        weight: .semibold,
                        design: .serif
                    )
                )
                .foregroundColor(.yogaGold)

            Text(roleTitle)
                .font(.caption)
                .fontWeight(.bold)
                .tracking(5)
                .foregroundColor(.yogaGreen.opacity(0.78))
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 80)
    }

    // MARK: - Role Information Section

    @ViewBuilder
    private var roleInfoSection: some View {

        if role == .participant {

            participantInfoSection

        } else {

            trainerInfoSection
        }
    }

    // MARK: - Participant Information

    private var participantInfoSection: some View {

        VStack(spacing: 22) {

            greetingSection
                .padding(.bottom, 20)

            HStack(spacing: 50) {

                profileMetric(
                    title: "LEVEL",
                    value: "Alle Levels"
                )

                profileMetric(
                    title: "CREDITS",
                    value: "\(bookingStore.credits)"
                )
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 30)
    }

    // MARK: - Trainer Information

    private var trainerInfoSection: some View {

        VStack(spacing: 20) {

            greetingSection
                .padding(.bottom, 20)
            
            HStack(spacing: 50) {

                profileMetric(
                    title: "STIL",
                    value: "Vinyasa & Yin"
                )

                profileMetric(
                    title: "ERFAHRUNG",
                    value: "6 Jahre"
                )
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 30)
    }

    // MARK: - Greeting Section

    private var greetingSection: some View {

        Text(greetingText)
            .font(
                .system(
                    size: 19,
                    weight: .regular,
                    design: .serif
                )
                .italic()
            )
            .foregroundColor(.yogaGold)
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity)
    }

    // MARK: - Profile Metric

    private func profileMetric(
        title: String,
        value: String
    ) -> some View {

        VStack(spacing: 5) {

            Text(title)
                .font(.caption)
                .fontWeight(.bold)
                .tracking(3)
                .foregroundColor(.yogaGold)

            Text(value)
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(.yogaGreen)
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .minimumScaleFactor(0.8)
        }
        .frame(maxWidth: .infinity)
    }

    // MARK: - Personal Data Section

    private var personalDataSection: some View {

        VStack(
            alignment: .leading,
            spacing: 22
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
                title: "STUDIO",
                value: "YogaNow Graz"
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
        .padding(.horizontal, 24)
        .padding(.vertical, 26)
        .background(
            Color.white.opacity(0.70)
        )
        .clipShape(
            RoundedRectangle(cornerRadius: 30)
        )
    }

    // MARK: - Profile Data Row

    private func profileDataRow(
        title: String,
        value: String
    ) -> some View {

        VStack(
            alignment: .leading,
            spacing: 3
        ) {

            Text(title)
                .font(.caption)
                .fontWeight(.bold)
                .tracking(2)
                .foregroundColor(.yogaGold)

            Text(value)
                .font(.body)
                .foregroundColor(.yogaGreen)
        }
        .frame(
            maxWidth: .infinity,
            alignment: .leading
        )
    }

    // MARK: - Logout Button

    private var logoutButton: some View {

        Button {

            Task {
                await sessionStore.signOut()
            }

        } label: {

            SecondaryButton(
                title: "Abmelden",
                icon: "rectangle.portrait.and.arrow.right"
            )
        }
    }
}

// MARK: - Participant Preview

#Preview("Teilnehmerin") {

    NavigationStack {

        ProfileView(
            role: .participant
        )
    }
    .environmentObject(BookingStore())
    .environment(FavoritesStore())
    .environmentObject(SessionStore())
}

// MARK: - Trainer Preview

#Preview("Trainerin") {

    NavigationStack {

        ProfileView(
            role: .trainer
        )
    }
    .environmentObject(BookingStore())
    .environment(FavoritesStore())
    .environmentObject(SessionStore())
}
