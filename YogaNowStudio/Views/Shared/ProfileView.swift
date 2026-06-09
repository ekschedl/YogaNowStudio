import SwiftUI

struct ProfileView: View {

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
                    }

                    // MARK: Stats

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
                    }
                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )
                    .padding(24)
                    .background(
                        Color.white.opacity(0.45)
                    )
                    .clipShape(
                        RoundedRectangle(
                            cornerRadius: 28
                        )
                    )

                    // MARK: Logout

                    Button {

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
