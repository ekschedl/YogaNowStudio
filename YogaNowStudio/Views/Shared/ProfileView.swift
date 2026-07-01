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

    private var participantLevel: String {
        let level = sessionStore.profile?.yogaLevel?
            .trimmingCharacters(in: .whitespacesAndNewlines)

        guard let level, !level.isEmpty else {
            return "Nicht hinterlegt"
        }
        return level
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
                    legalSection
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
                    value: participantLevel
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

// MARK: - Legal Section

private var legalSection: some View {

    VStack(
        alignment: .leading,
        spacing: 4
    ) {

        Text("RECHTLICHES & HILFE")
            .font(.caption)
            .fontWeight(.bold)
            .tracking(4)
            .foregroundColor(.yogaGold)
            .padding(.horizontal, 4)
            .padding(.bottom, 10)

        legalNavigationRow(
            title: "Datenschutzerklärung",
            icon: "hand.raised.fill",
            document: .privacy
        )

        Divider()
            .opacity(0.35)

        legalNavigationRow(
            title: "Impressum",
            icon: "building.2.fill",
            document: .imprint
        )

        Divider()
            .opacity(0.35)

        legalNavigationRow(
            title: "Support & Kontakt",
            icon: "envelope.fill",
            document: .support
        )

        Divider()
            .opacity(0.35)

        legalNavigationRow(
            title: "Nutzungsbedingungen",
            icon: "doc.text.fill",
            document: .terms
        )
    }
    .padding(.horizontal, 20)
    .padding(.vertical, 20)
    .background(
        Color.white.opacity(0.70)
    )
    .clipShape(
        RoundedRectangle(cornerRadius: 30)
    )
}

// MARK: - Legal Navigation Row

private func legalNavigationRow(
    title: String,
    icon: String,
    document: LegalDocument
) -> some View {

    NavigationLink {

        LegalDocumentView(
            document: document
        )

    } label: {

        HStack(spacing: 14) {

            Image(systemName: icon)
                .font(.system(size: 17))
                .foregroundColor(.yogaGold)
                .frame(width: 24)

            Text(title)
                .font(.body)
                .fontWeight(.medium)
                .foregroundColor(.yogaGreen)

            Spacer()

            Image(systemName: "chevron.right")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundColor(
                    .yogaGreen.opacity(0.55)
                )
        }
        .padding(.vertical, 12)
        .contentShape(Rectangle())
    }
    .buttonStyle(.plain)
}

// MARK: - Legal Document

enum LegalDocument {

    case privacy
    case imprint
    case support
    case terms

    var title: String {

        switch self {

        case .privacy:
            return "Datenschutzerklärung"

        case .imprint:
            return "Impressum"

        case .support:
            return "Support & Kontakt"

        case .terms:
            return "Nutzungsbedingungen"
        }
    }

    var icon: String {

        switch self {

        case .privacy:
            return "hand.raised.fill"

        case .imprint:
            return "building.2.fill"

        case .support:
            return "envelope.fill"

        case .terms:
            return "doc.text.fill"
        }
    }

    var content: String {

        switch self {

        case .privacy:
            return """
            Verantwortliche Stelle

            YogaNow Studio
            Flowstraße 34
            8010 Graz
            Österreich

            YogaNow verarbeitet personenbezogene Daten wie Namen, E-Mail-Adressen, Benutzerrollen, Kursbuchungen, Credit-Guthaben und Teilnehmerlisten.

            Die Daten werden ausschließlich für die Anmeldung, Kursverwaltung, Buchungsabwicklung, Credit-Verwaltung und Anzeige von Teilnehmerlisten verwendet.

            Die Authentifizierung und Datenspeicherung erfolgen über Supabase. Passwörter werden nicht in eigenen Anwendungstabellen gespeichert.

            Benutzer können Auskunft, Berichtigung oder Löschung ihrer personenbezogenen Daten bei der Studioadministration beantragen.

            Kontakt:
            datenschutz@yoganow.at

            Diese Datenschutzerklärung ist für die Projektversion von YogaNow vorgesehen und muss vor einer tatsächlichen Veröffentlichung rechtlich geprüft und vervollständigt werden.
            """

        case .imprint:
            return """
            YogaNow Studio

            Flowstraße 34
            8010 Graz
            Österreich

            Inhaberin und Medieninhaberin:
            YogaNow Studioleitung

            Unternehmensgegenstand:
            Betrieb eines Yoga-Studios sowie Bereitstellung von Yoga-Kursen und digitalen Informationsinhalten.

            Kontakt:
            office@yoganow.at
            +43 000 000000

            Verantwortlich für den Inhalt:
            YogaNow Studioleitung
            """

        case .support:
            return """
            Support & Kontakt

                Bei Fragen zur App, zu Buchungen, Credits, Kursen oder Benutzerkonten hilft das YogaNow Studio weiter.

                Technischer Support:

                support@yoganow.at

                Allgemeine Anfragen:

                office@yoganow.at

                Telefon:

                +43 000 000000

                Erreichbarkeit:

                Montag bis Freitag

                09:00 bis 18:00 Uhr

                Bei technischen Problemen bitte folgende Informationen angeben:

                • verwendetes iPhone-Modell

                • installierte iOS-Version

                • kurze Beschreibung des Problems

                • betroffene Ansicht oder Funktion

                • wenn möglich einen Screenshot

                Passwörter oder andere vertrauliche Zugangsdaten dürfen nicht per E-Mail übermittelt werden.
            """

        case .terms:
            return """
            Die YogaNow-App dient der Anzeige und Buchung von Kursen des YogaNow Studios.

            Benutzerkonten und Credits werden in Version 1.0 durch die Studioadministration verwaltet.

            Eine Kursbuchung ist nur bei ausreichendem Credit-Guthaben und verfügbaren Plätzen möglich.

            Bei einer Stornierung mehr als 24 Stunden vor Kursbeginn wird der verwendete Credit zurückerstattet. Innerhalb von 24 Stunden vor Kursbeginn erfolgt keine Credit-Rückerstattung.

            Bereits begonnene oder vergangene Kurse können nicht storniert werden.

            Diese Nutzungsbedingungen sind für die Projektversion vorgesehen und müssen vor einer tatsächlichen Veröffentlichung rechtlich geprüft werden.
            """
        }
    }
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
