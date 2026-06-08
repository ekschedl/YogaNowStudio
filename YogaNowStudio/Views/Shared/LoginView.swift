import SwiftUI

struct LoginView: View {

    @Environment(\.dismiss) private var dismiss

    @State private var email = ""
    @State private var password = ""

    @State private var showPassword = false
    @State private var showError = false

    @State private var showTrainerDashboard = false
    @State private var showParticipantDashboard = false

    var isTrainer: Bool {
        email.lowercased().hasSuffix("@yoga")
    }

    var body: some View {

        ZStack(alignment: .topLeading) {

            Image("BackgroundYoga")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            Button {
                dismiss()
            } label: {
                Image(systemName: "chevron.left")
                    .font(.title3)
                    .foregroundColor(.yogaGreen)
                    .padding(12)
                    .background(.white.opacity(0.9))
                    .clipShape(Circle())
                    .shadow(
                        color: .black.opacity(0.08),
                        radius: 6
                    )
            }
            .padding(.leading, 25)
            .padding(.top, 60)

            VStack {

                Image("LogoYogaNow")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 320)
                   

                VStack(alignment: .leading, spacing: 22) {

                    VStack(spacing: 10) {

                        Text("Login")
                            .font(
                                .system(
                                    size: 28,
                                    weight: .semibold,
                                    design: .serif
                                )
                            )
                            .foregroundColor(.yogaGreen)

                        Rectangle()
                            .fill(
                                Color.yogaGold.opacity(0.25)
                            )
                            .frame(
                                width: 80,
                                height: 1
                            )
                    }
                    .frame(maxWidth: .infinity)

                    VStack(
                        alignment: .leading,
                        spacing: 8
                    ) {

                        Text("E-Mail-Adresse")
                            .font(
                                .subheadline.weight(.medium)
                            )
                            .foregroundColor(.yogaGreen)

                        HStack {

                            Image(systemName: "envelope")
                                .foregroundColor(
                                    .gray.opacity(0.7)
                                )

                            TextField(
                                "E-Mail-Adresse",
                                text: $email
                            )
                            .textInputAutocapitalization(.never)
                            .autocorrectionDisabled()
                        }
                        .padding()
                        .background(
                            Color.white.opacity(0.9)
                        )
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(
                                cornerRadius: 12
                            )
                            .stroke(
                                Color.yogaGold.opacity(0.15)
                            )
                        )
                    }

                    VStack(
                        alignment: .leading,
                        spacing: 8
                    ) {

                        Text("Passwort")
                            .font(
                                .subheadline.weight(.medium)
                            )
                            .foregroundColor(.yogaGreen)

                        HStack {

                            Image(systemName: "lock")
                                .foregroundColor(
                                    .gray.opacity(0.7)
                                )

                            if showPassword {

                                TextField(
                                    "Passwort",
                                    text: $password
                                )

                            } else {

                                SecureField(
                                    "Passwort",
                                    text: $password
                                )
                            }

                            Button {

                                showPassword.toggle()

                            } label: {

                                Image(
                                    systemName: showPassword
                                    ? "eye.slash"
                                    : "eye"
                                )
                                .foregroundColor(
                                    .gray.opacity(0.7)
                                )
                            }
                        }
                        .padding()
                        .background(
                            Color.white.opacity(0.9)
                        )
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(
                                cornerRadius: 12
                            )
                            .stroke(
                                Color.yogaGold.opacity(0.15)
                            )
                        )
                    }

                    Button("Passwort vergessen?") {

                    }
                    .font(.footnote)
                    .foregroundColor(.yogaGreen)
                    .frame(maxWidth: .infinity)

                    if showError {

                        HStack(
                            alignment: .top,
                            spacing: 10
                        ) {

                            Image(
                                systemName:
                                "exclamationmark.triangle.fill"
                            )
                            .foregroundColor(.red)

                            Text(
                                "Bitte E-Mail und Passwort eingeben."
                            )
                            .font(.subheadline)
                            .foregroundColor(.red)
                            .fixedSize(
                                horizontal: false,
                                vertical: true
                            )
                        }
                        .padding()
                        .frame(
                            maxWidth: .infinity,
                            alignment: .leading
                        )
                        .background(
                            Color.yogaErrorBackground
                        )
                        .cornerRadius(14)
                    }

                    Button {

                        if email.isEmpty || password.isEmpty {

                            showError = true

                        } else {

                            showError = false

                            if isTrainer {

                                showTrainerDashboard = true

                            } else {

                                showParticipantDashboard = true
                            }
                        }

                    } label: {

                        Text("Anmelden")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 16)
                            .background(Color.yogaGreen)
                            .cornerRadius(14)
                    }

                    Text(
                        "Noch keinen Zugang? Bitte im Studio melden."
                    )
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity)
                }
                .padding(35)
                .background(
                    .white.opacity(0.92)
                )
                .cornerRadius(20)
                .shadow(
                    color: .black.opacity(0.08),
                    radius: 8
                )
                .padding(.horizontal)
                .frame(maxWidth: .infinity)
                .frame(height: 540)
                .offset(y: -25)
            }
            .padding(.horizontal, 20)
        }
        .navigationBarBackButtonHidden(true)
        .navigationDestination(
            isPresented: $showTrainerDashboard
        ) {
            TrainerDashboardView()
        }
        .navigationDestination(
            isPresented: $showParticipantDashboard
        ) {
            ParticipantDashboardView()
        }
    }
}

#Preview {

    NavigationStack {

        LoginView()
    }
    .environment(FavoritesStore())
}
