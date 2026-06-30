import SwiftUI

struct BookingSuccessView: View {

    let course: Course
    let onFinish: () -> Void
    @State private var showMyBookings = false

    var body: some View {

        ZStack {

            Image("BackgroundYoga")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack(spacing: 30) {

                Spacer()

                // MARK: Success Icon

                ZStack {

                    Circle()
                        .fill(Color.white.opacity(0.72))
                        .frame(width: 120, height: 120)

                    Circle()
                        .stroke(
                            Color.yogaGold.opacity(0.35),
                            lineWidth: 1
                        )
                        .frame(width: 120, height: 120)

                    Image(systemName: "checkmark")
                        .font(
                            .system(
                                size: 48,
                                weight: .semibold
                            )
                        )
                        .foregroundColor(.green)
                }

                // MARK: Text

                VStack(spacing: 12) {

                    Text("Kurs gebucht")
                        .font(
                            .system(
                                size: 38,
                                weight: .semibold,
                                design: .serif
                            )
                        )
                        .foregroundColor(.yogaGreen)

                    Text("DEINE BUCHUNG WURDE BESTÄTIGT")
                        .font(.caption)
                        .fontWeight(.bold)
                        .tracking(4)
                        .foregroundColor(.yogaGold)

                }

                // MARK: Small Info

                Text("Du wirst automatisch zu deinen Buchungen weitergeleitet.")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 30)

                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .navigationDestination(
            isPresented: $showMyBookings
        ) {
            MyBookingsView()
        }
        .task {

            try? await Task.sleep(
                nanoseconds: 3_000_000_000
            )

            showMyBookings = true
        }
    }
}

#Preview {

    NavigationStack {

        BookingSuccessView(
            course: Course(
                title: "Morning Flow",
                day: "Donnerstag",
                time: "08:30 Uhr",
                room: "Raum 1",
                participants: 12,
                maxParticipants: 15,
                imageName: "ImageCourse01"
            ),
            onFinish: {}
        )
    }
    .environmentObject(BookingStore())
    .environment(FavoritesStore())
}
