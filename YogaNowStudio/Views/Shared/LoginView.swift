/**E-Mail + Passwort
 → Supabase Auth
 → eigenes Profil laden
 → role aus profiles auslesen
 → passende MainTabView öffnen
 */
import SwiftUI

struct LoginView: View {

    // MARK: - Environment

    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var sessionStore: SessionStore


    // MARK: - Form State

    @State private var email = ""
    @State private var password = ""
    @State private var showPassword = false

    // MARK: - Login State

    @State private var isLoading = false
    @State private var errorMessage: String?

    // MARK: - Body

    var body: some View {

        ZStack(alignment: .topLeading) {

            background

            ScrollView(showsIndicators: false) {

                VStack {

                    logoSection

                    loginCard
                }
                .padding(.horizontal, 20)
            }
        }
        .navigationBarTitleDisplayMode(.inline)

    }

    // MARK: - Background

    private var background: some View {

        Image("BackgroundYoga")
            .resizable()
            .scaledToFill()
            .ignoresSafeArea()
    }

    // MARK: - Logo Section

    private var logoSection: some View {

        Image("LogoYogaNow")
            .resizable()
            .scaledToFit()
            .frame(width: 320)
    }

    // MARK: - Login Card

    private var loginCard: some View {

        VStack(alignment: .leading, spacing: 22) {

            titleSection

            emailField

            passwordField

            forgotPasswordButton

            if let errorMessage {
                errorView(message: errorMessage)
            }

            loginButton

            Text("Noch keinen Zugang? Bitte im Studio melden.")
                .font(.footnote)
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity)
        }
        .padding(35)
        .background(
            Color.white.opacity(0.92)
        )
        .clipShape(
            RoundedRectangle(cornerRadius: 20)
        )
        .shadow(
            color: .black.opacity(0.08),
            radius: 8
        )
        .padding(.horizontal)
        .offset(y: -25)
    }

    // MARK: - Title Section

    private var titleSection: some View {

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
    }

    // MARK: - Email Field

    private var emailField: some View {

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
                .keyboardType(.emailAddress)
                .textContentType(.username)
                .autocorrectionDisabled()
                .disabled(isLoading)
            }
            .padding()
            .background(
                Color.white.opacity(0.9)
            )
            .clipShape(
                RoundedRectangle(cornerRadius: 12)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(
                        Color.yogaGold.opacity(0.15)
                    )
            )
        }
    }

    // MARK: - Password Field

    private var passwordField: some View {

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

                Group {

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
                }
                .textContentType(.password)
                .disabled(isLoading)

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
                .disabled(isLoading)
            }
            .padding()
            .background(
                Color.white.opacity(0.9)
            )
            .clipShape(
                RoundedRectangle(cornerRadius: 12)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(
                        Color.yogaGold.opacity(0.15)
                    )
            )
        }
    }

    // MARK: - Forgot Password Button

    private var forgotPasswordButton: some View {

        Button("Passwort vergessen?") {
            // Wird später mit Supabase Password Reset verbunden.
        }
        .font(.footnote)
        .foregroundColor(.yogaGreen)
        .frame(maxWidth: .infinity)
        .disabled(isLoading)
    }

    // MARK: - Login Button

    private var loginButton: some View {

        Button {

            Task {
                await performLogin()
            }

        } label: {

            if isLoading {

                HStack(spacing: 10) {

                    ProgressView()
                        .tint(.white)

                    Text("Anmelden …")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 52)
                .background(Color.yogaGreen)
                .clipShape(
                    RoundedRectangle(cornerRadius: 14)
                )

            } else {

                PrimaryButton(
                    title: "Anmelden",
                    icon: "person.fill"
                )
            }
        }
        .disabled(isLoading)
        .opacity(isLoading ? 0.85 : 1)
    }

    // MARK: - Error View

    private func errorView(
        message: String
    ) -> some View {

        HStack(
            alignment: .top,
            spacing: 10
        ) {

            Image(
                systemName: "exclamationmark.triangle.fill"
            )
            .foregroundColor(.red)

            Text(message)
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
        .clipShape(
            RoundedRectangle(cornerRadius: 14)
        )
    }

    // MARK: - Login
    
    @MainActor
    private func performLogin() async {

        let cleanEmail = email
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .lowercased()

        guard !cleanEmail.isEmpty,
              !password.isEmpty else {

            errorMessage = "Bitte E-Mail und Passwort eingeben."
            return
        }

        isLoading = true
        errorMessage = nil

        do {

            try await sessionStore.signIn(
                email: cleanEmail,
                password: password
            )

        } catch {

            errorMessage =
                "Die Anmeldung ist fehlgeschlagen. Bitte überprüfe deine E-Mail-Adresse und dein Passwort."
        }

        isLoading = false
    }
    
}
// MARK: - Preview

#Preview {

    NavigationStack {

        LoginView()
    }
    .environment(FavoritesStore())
    .environmentObject(BookingStore())
    .environmentObject(SessionStore())
}
