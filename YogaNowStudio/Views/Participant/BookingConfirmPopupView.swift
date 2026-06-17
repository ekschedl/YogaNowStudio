import SwiftUI

struct BookingConfirmPopupView: View {

    let course: Course
    let credits: Int
    let isBooking: Bool
    let errorMessage: String?
    let onCancel: () -> Void
    let onConfirm: () -> Void

    // MARK: - Computed Properties

    private var courseDateText: String {

        course.date.formatted(
            .dateTime
                .weekday(.wide)
                .day()
                .month(.wide)
                .locale(Locale(identifier: "de_DE"))
        )
    }

    private var canBook: Bool {
        credits > 0 && !isBooking
    }

    private var creditText: String {

        if credits == 1 {
            return "1 verfügbarer Credit"
        }

        return "\(credits) verfügbare Credits"
    }

    // MARK: - Body

    var body: some View {

        ZStack {

            Color.black.opacity(0.28)
                .ignoresSafeArea()

            VStack(spacing: 22) {

                Image(systemName: "calendar.badge.checkmark")
                    .font(.system(size: 34))
                    .foregroundColor(.yogaGold)

                VStack(spacing: 6) {

                    Text("Buchung bestätigen")
                        .font(
                            .system(
                                size: 30,
                                weight: .semibold,
                                design: .serif
                            )
                        )
                        .foregroundColor(.yogaGreen)

                    Text("MÖCHTEST DU DIESEN KURS BUCHEN?")
                        .font(.caption)
                        .fontWeight(.bold)
                        .tracking(3)
                        .foregroundColor(.yogaGold)
                        .multilineTextAlignment(.center)
                }

                Divider()

                VStack(alignment: .leading, spacing: 14) {

                    Text(course.title)
                        .font(
                            .system(
                                size: 26,
                                weight: .semibold,
                                design: .serif
                            )
                        )
                        .foregroundColor(.yogaGreen)

                    infoRow(
                        icon: "calendar",
                        text: courseDateText
                    )

                    infoRow(
                        icon: "clock.fill",
                        text: course.time
                    )

                    infoRow(
                        icon: "person.2.fill",
                        text: "\(course.participants) Teilnehmer"
                    )
                }
                .frame(
                    maxWidth: .infinity,
                    alignment: .leading
                )

                VStack(alignment: .leading, spacing: 10) {

                    Text("DEINE CREDITS")
                        .font(.caption)
                        .fontWeight(.bold)
                        .tracking(3)
                        .foregroundColor(.yogaGold)

                    Text(creditText)
                        .fontWeight(.semibold)
                        .foregroundColor(
                            credits > 0
                                ? .yogaGreen
                                : .red
                        )

                    if credits > 0 {

                        Text(
                            "Für diese Buchung wird 1 Credit verwendet. Kostenlose Stornierung bis 24 Stunden vor Kursbeginn."
                        )
                        .font(.footnote)
                        .foregroundColor(.gray)

                    } else {

                        Text(
                            "Du hast aktuell keine Credits und kannst diesen Kurs nicht buchen."
                        )
                        .font(.footnote)
                        .foregroundColor(.red)
                    }
                }
                .frame(
                    maxWidth: .infinity,
                    alignment: .leading
                )
                .padding()
                .background(
                    Color.yogaCream.opacity(0.65)
                )
                .clipShape(
                    RoundedRectangle(cornerRadius: 18)
                )

                if let errorMessage {

                    Text(errorMessage)
                        .font(.subheadline)
                        .foregroundColor(.red)
                        .padding()
                        .frame(
                            maxWidth: .infinity,
                            alignment: .leading
                        )
                        .background(
                            Color.red.opacity(0.08)
                        )
                        .clipShape(
                            RoundedRectangle(cornerRadius: 16)
                        )
                }

                VStack(spacing: 10) {

                    Button {
                        onConfirm()
                    } label: {
                        PrimaryButton(
                            title:
                                isBooking
                                ? "Wird gebucht..."
                                : "Buchen",
                            icon: "checkmark.circle.fill"
                        )
                    }
                    .disabled(!canBook)
                    .opacity(canBook ? 1 : 0.55)

                    Button {
                        onCancel()
                    } label: {
                        SecondaryButton(
                            title: "Abbrechen",
                            icon: "xmark.circle"
                        )
                    }
                    .disabled(isBooking)
                }
            }
            .padding(26)
            .background(
                LinearGradient(
                    colors: [
                        Color.white.opacity(0.97),
                        Color.yogaCream.opacity(0.94)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .clipShape(
                RoundedRectangle(cornerRadius: 32)
            )
            .padding(.horizontal, 28)
        }
    }

    // MARK: - Info Row

    private func infoRow(
        icon: String,
        text: String
    ) -> some View {

        HStack(spacing: 12) {

            Image(systemName: icon)
                .foregroundColor(.yogaGold)
                .frame(width: 22)

            Text(text)
                .fontWeight(.semibold)
                .foregroundColor(.yogaGreen)

            Spacer()
        }
    }
}

// MARK: - Preview

#Preview {

    BookingConfirmPopupView(
        course: Course(
            title: "Morning Flow",
            day: "Donnerstag",
            time: "08:30",
            room: "Raum 1",
            participants: 12,
            imageName: "ImageCourse01"
        ),
        credits: 8,
        isBooking: false,
        errorMessage: nil,
        onCancel: {},
        onConfirm: {}
    )
}
