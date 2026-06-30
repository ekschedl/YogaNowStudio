import SwiftUI

struct BookingSuccessView: View {

    let course: Course

    let onFinished: () -> Void

    var body: some View {

        ZStack {

            Image("BackgroundYoga")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack(spacing: 30) {

                Spacer()

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

                VStack(spacing: 6) {

                    Text(course.title)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.yogaGreen)

                    Text("\(course.day), \(course.time)")
                        .font(.subheadline)
                        .foregroundColor(.gray)

                    Text(course.room)
                        .font(.footnote)
                        .foregroundColor(.gray)
                }

                Text(
                    "Du wirst automatisch zu deinen Buchungen weitergeleitet."
                )
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)

                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .task {
            try? await Task.sleep(
                for: .seconds(2)
            )
            guard !Task.isCancelled else {
                return
            }
            onFinished()
        }
    }
}

#Preview {

    NavigationStack {

        BookingSuccessView(
            course: Course(
                title: "Morning Flow",
                day: "Donnerstag",
                time: "08:30 - 09:30",
                room: "Raum 1",
                participants: 12,
                maxParticipants: 15,
                imageName: "ImageCourse01"
            ),
                 onFinished: {}
        )
    }
}
