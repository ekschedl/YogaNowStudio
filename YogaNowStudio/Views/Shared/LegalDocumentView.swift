//
//  LegalDocumentView.swift
//  YogaNowStudio
//

import SwiftUI

// MARK: - Legal Document

enum LegalDocument {

    case privacy
    case imprint
    case support
    case terms

    var titleFontSize: CGFloat {
        switch self {
        case .privacy:
            return 29
        case .terms:
            return 30
        case .imprint,
             .support:
            return 35
        }
    }
    
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

    var subtitle: String {

        switch self {

        case .privacy:
            return "Deine Daten. Sicher und transparent."

        case .imprint:
            return "Informationen zum YogaNow Studio"

        case .support:
            return "Wir sind für dich da."

        case .terms:
            return "Regeln für eine achtsame Nutzung"
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

    var sections: [LegalSection] {

        switch self {

        case .privacy:
            return [

                LegalSection(
                    title: "VERANTWORTLICHE STELLE",
                    text: """
                    YogaNow Studio
                    Flowstraße 34
                    8010 Graz
                    Österreich
                    """
                ),

                LegalSection(
                    title: "VERARBEITETE DATEN",
                    text: """
                    YogaNow verarbeitet personenbezogene Daten wie Namen, E-Mail-Adressen, Benutzerrollen, Kursbuchungen, Credit-Guthaben und Teilnehmerlisten.
                    """
                ),

                LegalSection(
                    title: "ZWECK DER VERARBEITUNG",
                    text: """
                    Die Daten werden für die Anmeldung, Benutzerverwaltung, Kursbuchung, Credit-Verwaltung und Anzeige von Teilnehmerlisten verwendet.
                    """
                ),

                LegalSection(
                    title: "DATENSPEICHERUNG",
                    text: """
                    Die Authentifizierung und Datenspeicherung erfolgen über Supabase. Passwörter werden nicht in eigenen Anwendungstabellen gespeichert.
                    """
                ),

                LegalSection(
                    title: "DEINE RECHTE",
                    text: """
                    Benutzer können bei der Studioadministration Auskunft, Berichtigung oder Löschung ihrer personenbezogenen Daten beantragen.
                    """
                ),

                LegalSection(
                    title: "DATENSCHUTZKONTAKT",
                    text: """
                    datenschutz@yoganow.at
                    """
                ),

                LegalSection(
                    title: "HINWEIS",
                    text: """
                    Diese Datenschutzerklärung ist für die Projektversion von YogaNow vorgesehen. Vor einer tatsächlichen Veröffentlichung muss sie rechtlich geprüft und vervollständigt werden.
                    """
                )
            ]

        case .imprint:
            return [

                LegalSection(
                    title: "STUDIO",
                    text: """
                    YogaNow Studio
                    Flowstraße 34
                    8010 Graz
                    Österreich
                    """
                ),

                LegalSection(
                    title: "INHABERIN",
                    text: """
                    YogaNow Studioleitung
                    """
                ),

                LegalSection(
                    title: "UNTERNEHMENSGEGENSTAND",
                    text: """
                    Betrieb eines Yoga-Studios sowie Bereitstellung von Yoga-Kursen und digitalen Informationsinhalten.
                    """
                ),

                LegalSection(
                    title: "KONTAKT",
                    text: """
                    office@yoganow.at
                    +43 000 000000
                    """
                ),

                LegalSection(
                    title: "INHALTLICHE VERANTWORTUNG",
                    text: """
                    Verantwortlich für die Inhalte der Anwendung ist die YogaNow Studioleitung.
                    """
                ),

                LegalSection(
                    title: "HINWEIS",
                    text: """
                    Die angegebenen Kontaktdaten sind Beispieldaten und müssen vor einer tatsächlichen Veröffentlichung durch die vollständigen Unternehmensdaten ersetzt werden.
                    """
                )
            ]

        case .support:
            return [

                LegalSection(
                    title: "WOBEI KÖNNEN WIR HELFEN?",
                    text: """
                    Das YogaNow Studio unterstützt dich bei Fragen zu Kursen, Buchungen, Credits, Benutzerkonten und technischen Problemen innerhalb der App.
                    """
                ),

                LegalSection(
                    title: "TECHNISCHER SUPPORT",
                    text: """
                    support@yoganow.at
                    """
                ),

                LegalSection(
                    title: "ALLGEMEINE ANFRAGEN",
                    text: """
                    office@yoganow.at
                    """
                ),

                LegalSection(
                    title: "TELEFON",
                    text: """
                    +43 000 000000
                    """
                ),

                LegalSection(
                    title: "ERREICHBARKEIT",
                    text: """
                    Montag bis Freitag
                    09:00 bis 18:00 Uhr
                    """
                ),

                LegalSection(
                    title: "BEI TECHNISCHEN PROBLEMEN",
                    text: """
                    Bitte teile uns das verwendete iPhone-Modell, die installierte iOS-Version und eine kurze Beschreibung des Problems mit.

                    Ein Screenshot der betroffenen Ansicht kann bei der Fehleranalyse helfen.
                    """
                ),

                LegalSection(
                    title: "SICHERHEITSHINWEIS",
                    text: """
                    Passwörter oder andere vertrauliche Zugangsdaten dürfen nicht per E-Mail übermittelt werden.
                    """
                )
            ]

        case .terms:
            return [

                LegalSection(
                    title: "NUTZUNG DER APP",
                    text: """
                    Die YogaNow-App dient der Anzeige und Buchung von Kursen des YogaNow Studios.
                    """
                ),

                LegalSection(
                    title: "BENUTZERKONTEN UND CREDITS",
                    text: """
                    Benutzerkonten und Credit-Guthaben werden in Version 1.0 durch die Studioadministration verwaltet.
                    """
                ),

                LegalSection(
                    title: "KURSBUCHUNG",
                    text: """
                    Eine Buchung ist nur bei ausreichendem Credit-Guthaben und verfügbaren Kursplätzen möglich.
                    """
                ),

                LegalSection(
                    title: "STORNIERUNG",
                    text: """
                    Bei einer Stornierung mehr als 24 Stunden vor Kursbeginn wird der verwendete Credit zurückerstattet.

                    Innerhalb von 24 Stunden vor Kursbeginn erfolgt keine Credit-Rückerstattung.
                    """
                ),

                LegalSection(
                    title: "VERGANGENE KURSE",
                    text: """
                    Bereits begonnene oder vergangene Kurse können nicht storniert werden.
                    """
                ),

                LegalSection(
                    title: "HINWEIS",
                    text: """
                    Diese Nutzungsbedingungen gelten für die Projektversion von YogaNow und müssen vor einer tatsächlichen Veröffentlichung rechtlich geprüft werden.
                    """
                )
            ]
        }
    }
}

// MARK: - Legal Section Model

struct LegalSection: Identifiable {

    let id = UUID()
    let title: String
    let text: String
}

// MARK: - Legal Document View

struct LegalDocumentView: View {

    let document: LegalDocument

    var body: some View {

        ZStack {

            Image("BackgroundYoga")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            ScrollView(showsIndicators: false) {

                VStack(spacing: 28) {

                    headerSection

                    documentCard

                    Spacer()
                        .frame(height: 50)
                }
                .padding(.horizontal, 22)
                .padding(.top, 85)
            }
        }
        .toolbarBackground(
            .hidden,
            for: .navigationBar
        )
    }

    // MARK: - Header

    private var headerSection: some View {

        VStack(spacing: 14) {

            ZStack {

                Circle()
                    .fill(
                        Color.white.opacity(0.58)
                    )
                    .frame(
                        width: 76,
                        height: 76
                    )

                Circle()
                    .stroke(
                        Color.yogaGold.opacity(0.65),
                        lineWidth: 1.5
                    )
                    .frame(
                        width: 76,
                        height: 76
                    )

                Image(systemName: document.icon)
                    .font(
                        .system(
                            size: 30,
                            weight: .light
                        )
                    )
                    .foregroundColor(.yogaGold)
            }

            Text(document.title)
                .font(
                    .system(
                        size: document.titleFontSize,
                        weight: .semibold,
                        design: .serif
                    )
                )
                .foregroundColor(.yogaGreen)
                .multilineTextAlignment(.center)
                .lineLimit(1)
                .minimumScaleFactor(0.75)
                .frame(maxWidth: .infinity)

            Text(document.subtitle)
                .font(
                    .system(
                        size: 17,
                        weight: .regular,
                        design: .serif
                    )
                    .italic()
                )
                .foregroundColor(
                    .yogaGold
                )
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .padding(.top, -50)
    }

    // MARK: - Document Card

    private var documentCard: some View {

        VStack(
            alignment: .leading,
            spacing: 0
        ) {

            ForEach(
                Array(document.sections.enumerated()),
                id: \.element.id
            ) { index, section in

                legalSectionView(section)

                if index < document.sections.count - 1 {

                    Divider()
                        .overlay(
                            Color.yogaGold.opacity(0.25)
                        )
                        .padding(.vertical, 22)
                }
            }
        }
        .frame(
            maxWidth: .infinity,
            alignment: .leading
        )
        .padding(.horizontal, 26)
        .padding(.vertical, 30)
        .background(
            Color.white.opacity(0.82)
        )
        .clipShape(
            RoundedRectangle(
                cornerRadius: 32
            )
        )
        .overlay {

            RoundedRectangle(
                cornerRadius: 32
            )
            .stroke(
                Color.yogaGold.opacity(0.24),
                lineWidth: 1
            )
        }
        .shadow(
            color: .black.opacity(0.06),
            radius: 14,
            x: 0,
            y: 7
        )
    }

    // MARK: - Section View

    private func legalSectionView(
        _ section: LegalSection
    ) -> some View {

        VStack(
            alignment: .leading,
            spacing: 11
        ) {

            Text(section.title)
                .font(.caption)
                .fontWeight(.bold)
                .tracking(2.4)
                .foregroundColor(.yogaGold)

            Text(section.text)
                .font(
                    .system(
                        size: 17,
                        weight: .regular,
                        design: .rounded
                    )
                )
                .foregroundColor(.yogaGreen)
                .lineSpacing(6)
                .frame(
                    maxWidth: .infinity,
                    alignment: .leading
                )
                .textSelection(.enabled)
        }
        .frame(
            maxWidth: .infinity,
            alignment: .leading
        )
    }
}

// MARK: - Preview

#Preview("Support") {

    NavigationStack {

        LegalDocumentView(
            document: .support
        )
    }
}
