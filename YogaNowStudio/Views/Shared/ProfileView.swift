import SwiftUI

struct ProfileView: View {

    @Environment(\.dismiss) private var dismiss
    let role: UserRole

    var body: some View {

        ZStack {

            Image("BackgroundYoga")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            ScrollView(showsIndicators: false) {

                VStack(spacing: 32) {

                    // MARK: Header

                    VStack(spacing: 8) {

                        Text("Namasté")
                            .font(.title3)
                            .foregroundColor(.yogaGreen)

                        Text("Katja")
                            .font(
                                .system(
                                    size: 44,
                                    weight: .semibold,
                                    design: .serif
                                )
                            )
                            .tracking(2)
                            .foregroundColor(.yogaGold)
                    }
                    .padding(.top, 70)

                    // MARK: Credits
                    // MARK: Teilnehmer / Trainer Infos

                    if role == .participant {

                        VStack(spacing: 6) {

                            Text("CREDITS")
                                .font(.caption)
                                .fontWeight(.bold)
                                .tracking(4)
                                .foregroundColor(.yogaGold)

                            Text("8")
                                .font(
                                    .system(
                                        size: 72,
                                        weight: .bold,
                                        design: .serif
                                    )
                                )
                                .foregroundColor(.yogaGreen)
                        }

                        HStack(spacing: 20) {

                            VStack(spacing: 6) {

                                Text("LEVEL")
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .tracking(3)
                                    .foregroundColor(.yogaGold)

                                Text("Alle Levels")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.yogaGreen)
                            }
                            .frame(maxWidth: .infinity)

                            VStack(spacing: 6) {

                                Text("KURSE")
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .tracking(3)
                                    .foregroundColor(.yogaGold)

                                Text("12")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.yogaGreen)
                            }
                            .frame(maxWidth: .infinity)
                        }

                    } else {

                        Text("YOGA TRAINERIN")
                            .font(.caption)
                            .fontWeight(.bold)
                            .tracking(4)
                            .foregroundColor(.yogaGold)

                        HStack(spacing: 20) {

                            VStack(spacing: 6) {

                                Text("STIL")
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .tracking(3)
                                    .foregroundColor(.yogaGold)

                                Text("Vinyasa & Yin Yoga")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.yogaGreen)
                                    .multilineTextAlignment(.center)
                            }
                            .frame(maxWidth: .infinity)

                            VStack(spacing: 6) {

                                Text("ERFAHRUNG")
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .tracking(3)
                                    .foregroundColor(.yogaGold)

                                Text("6 Jahre")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.yogaGreen)
                            }
                            .frame(maxWidth: .infinity)
                        }
                    }

                    // MARK: Persönliche Daten

                    VStack(
                        alignment: .leading,
                        spacing: 24
                    ) {

                        Text("PERSÖNLICHE DATEN")
                            .font(.caption)
                            .fontWeight(.bold)
                            .tracking(4)
                            .foregroundColor(.yogaGold)

                        VStack(
                            alignment: .leading,
                            spacing: 4
                        ) {

                            Text("E-MAIL")
                                .font(.caption)
                                .fontWeight(.bold)
                                .tracking(2)
                                .foregroundColor(.yogaGold)

                            Text("katja@test.at")
                                .foregroundColor(.yogaGreen)
                        }

                        VStack(
                            alignment: .leading,
                            spacing: 4
                        ) {

                            Text("STUDIO")
                                .font(.caption)
                                .fontWeight(.bold)
                                .tracking(2)
                                .foregroundColor(.yogaGold)

                            Text("YogaNow Graz")
                                .foregroundColor(.yogaGreen)
                        }

                        if role == .participant {

                            VStack(
                                alignment: .leading,
                                spacing: 4
                            ) {

                                Text("MITGLIED SEIT")
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .tracking(2)
                                    .foregroundColor(.yogaGold)

                                Text("Juni 2026")
                                    .foregroundColor(.yogaGreen)
                            }

                        } else {
                            
                            VStack(
                                alignment: .leading,
                                spacing: 4
                            ) {
                                
                                Text("TRAINER SEIT")
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .tracking(2)
                                    .foregroundColor(.yogaGold)
                                
                                Text("2024")
                                    .foregroundColor(.yogaGreen)
                            }}
                        }
                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )
                    .padding(24)
                    .background(
                        Color.yogaCream.opacity(0.95)
                    )
                    .clipShape(
                        RoundedRectangle(
                            cornerRadius: 28
                        )
                    )
                    // MARK: Logout
                    Button {
                        dismiss()
                    } label: {
                        SecondaryButton(
                            title: "Abmelden",
                            icon: "rectangle.portrait.and.arrow.right"
                        )
                    }
                    Spacer()
                        .frame(height: 100)
                }
                .padding(.horizontal)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {

    NavigationStack {

        ProfileView(
            role: .participant
        )
    }
    .environment(FavoritesStore())
}
