//
//  WelcomeView.swift
//  YogaNowStudio
//
//  Created by Kaaatkina on 01.06.26.
//

import SwiftUI

struct WelcomeView: View {

    var body: some View {

        NavigationStack {

            ZStack {

                Image("BackgroundYoga")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()

                VStack(spacing: 0) {

                    // MARK: - Language Button

                    HStack {

                        Spacer()

                        HStack(spacing: 6) {

                            Image(systemName: "globe")

                            Text("DE")
                        }
                        .foregroundColor(.yogaGreen)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 12)
                        .background(
                            Color.white.opacity(0.5)
                        )
                        .clipShape(Capsule())
                    }
                    .padding(.top, 55)
                    .padding(.trailing, 24)

                    // MARK: - Logo

                    Image("LogoYogaNow")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 420)

                    // MARK: - Main Navigation

                    VStack(spacing: 20) {

                        NavigationLink {

                            YogaLibraryView()

                        } label: {

                            NavigationCard(
                                title: "Yoga Library",
                                iconName: "IconLibrary"
                            )
                        }
                        .buttonStyle(.plain)

                        NavigationLink {

                            LoginView()

                        } label: {

                            NavigationCard(
                                title: "YogaNow Plattform",
                                iconName: "IconCourse"
                            )
                        }
                        .buttonStyle(.plain)
                    }
                    .padding(.horizontal, 30)

                    Spacer()

                    // MARK: - Legal Navigation

                    legalNavigation
                        .padding(.horizontal, 30)
                        .padding(.bottom, 24)
                }
            }
        }
    }

    // MARK: - Legal Navigation

    private var legalNavigation: some View {

        HStack(spacing: 12) {

            Link(
                "Datenschutz",
                destination: AppLinks.privacyPolicy
            )
            .fontWeight(.medium)
            .foregroundColor(.yogaGreen)

            Text("•")

            NavigationLink {
                LegalDocumentView(document: .imprint)
            } label: {
                Text("Impressum")
            }

            Text("•")

            NavigationLink {
                LegalDocumentView(document: .support)
            } label: {
                Text("Support")
            }
        }
        .font(.caption)
        .fontWeight(.medium)
        .foregroundColor(.yogaGreen)
        .frame(maxWidth: .infinity)
        .padding(.vertical, 11)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white.opacity(0.72))
        )
        .buttonStyle(.plain)
        .padding(.horizontal, 26)
    }
}
// MARK: - Preview

#Preview {

    WelcomeView()
        .environment(FavoritesStore())
        .environmentObject(BookingStore())
        .environmentObject(SessionStore())
}
