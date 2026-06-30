import SwiftUI

struct ProfileView: View {

    // MARK: - Environment
    @EnvironmentObject private var bookingStore: BookingStore
    @EnvironmentObject private var sessionStore: SessionStore

    @EnvironmentObject private var courseStore: CourseStore
    // MARK: - Properties

    let role: UserRole

    // MARK: - User Information

    private var currentRole: UserRole {
        sessionStore.profile?.role ?? role
    }

    private var userName: String {
        sessionStore.profile?.greetingName
            ?? "Benutzer"
    }

    private var fullUserName: String {
        sessionStore.profile?.fullName
            ?? "Benutzer"
    }

    private var userEmail: String {
        sessionStore.email ?? "Keine E-Mail verfügbar"
    }

    private var roleTitle: String {
        currentRole == .trainer
            ? "YOGA TRAINERIN"
            : "TEILNEHMERIN"
    }

    private var greetingText: String {
        currentRole == .trainer
            ? "Atme ein. Inspiriere."
            : "Atme ein. Komm bei dir an."
    }

    private var memberTitle: String {
        currentRole == .trainer
            ? "TRAINER SEIT"
            : "MITGLIED SEIT"
    }

    private var memberValue: String {
        if currentRole == .trainer {
            return sessionStore.profile?.trainerSince ?? "Noch nicht hinterlegt"
        } else {
            return sessionStore.profile?.memberSince ?? "Noch nicht hinterlegt"
        }
    }

    private var yogaStyle: String {
        sessionStore.profile?.yogaStyle ?? "Noch nicht hinterlegt"
    }

    private var experienceValue: String {
        guard let years = sessionStore.profile?.experienceYears else {
            return "Noch nicht hinterlegt"
        }

        return years == 1
            ? "1 Jahr"
            : "\(years) Jahre"
    }

    private var creditsValue: String {
        "\(bookingStore.credits)"
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
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.7)
                .lineLimit(2)

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

        if currentRole == .participant {

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
                    value: creditsValue
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
                    value: yogaStyle
                )

                profileMetric(
                    title: "ERFAHRUNG",
                    value: experienceValue
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
                value: fullUserName
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

                bookingStore.reset()
                courseStore.reset()
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
    .environmentObject(SessionStore())
    .environmentObject(BookingStore())
    .environmentObject(CourseStore())
}

// MARK: - Trainer Preview

#Preview("Trainerin") {

    NavigationStack {

        ProfileView(
            role: .trainer
        )
    }
    .environmentObject(SessionStore())
    .environmentObject(BookingStore())
    .environmentObject(CourseStore())
}
