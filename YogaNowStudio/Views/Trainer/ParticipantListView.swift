import SwiftUI

struct ParticipantListView: View {

    // MARK: - Environment

    @EnvironmentObject private var bookingStore: BookingStore

    // MARK: - Properties

    let courseDate: Date
    let courseID: UUID
    let courseTitle: String

    private var isPastCourse: Bool {
        courseDate <= Date()
    }
    // MARK: - Body

    var body: some View {

        ZStack {

            Image("BackgroundYoga")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            if isPastCourse {
                Color.white
                    .opacity(0.65)
                    .ignoresSafeArea()
            }
            VStack(spacing: 0) {

                headerSection

                LinearGradient(
                    colors: [
                        Color.white.opacity(0),
                        Color.white.opacity(0.4),
                        Color.white.opacity(0.8),
                        Color.white
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .frame(height: 60)

                participantsSection

                LinearGradient(
                    colors: [
                        Color.white,
                        Color.white.opacity(0.8),
                        Color.white.opacity(0.4),
                        Color.clear
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .frame(height: 100)
            }
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await bookingStore.loadParticipants(
                for: courseID
            )
        }
    }

    // MARK: - Header

    private var headerSection: some View {

        VStack(spacing: 10) {

            Text(courseTitle.uppercased())
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(.yogaGold)
                .tracking(3)

            Text("Teilnehmerliste")
                .font(
                    .system(
                        size: 30,
                        weight: .semibold,
                        design: .serif
                    )
                )
                .foregroundColor(.yogaGreen)
                .padding(.bottom, 20)

            Text("\(bookingStore.courseParticipants.count) Teilnehmer")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.yogaGreen)
                .padding(.horizontal, 14)
                .padding(.vertical, 8)
                .background(
                    Color.white.opacity(0.82)
                )
                .clipShape(Capsule())
                .overlay(
                    Capsule()
                        .stroke(
                            Color.yogaGold.opacity(0.35),
                            lineWidth: 1
                        )
                )
        }
        .padding(.top, 60)
    }

    // MARK: - Participants Section

    @ViewBuilder
    private var participantsSection: some View {

      
        
        if bookingStore.isLoadingParticipants {

            ProgressView("Teilnehmer werden geladen …")
                .frame(maxWidth: .infinity, maxHeight: .infinity)

        } else if let errorMessage =
                    bookingStore.participantsErrorMessage {

            Text(errorMessage)
                .font(.footnote)
                .foregroundColor(.red)
                .multilineTextAlignment(.center)
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)

        } else if bookingStore.courseParticipants.isEmpty {

            VStack(spacing: 12) {

                Image(systemName: "person.2.slash")
                    .font(.system(size: 34))
                    .foregroundColor(.yogaGold)

                Text("Keine Teilnehmer")
                    .font(
                        .system(
                            size: 26,
                            weight: .semibold,
                            design: .serif
                        )
                    )
                    .foregroundColor(.yogaGreen)

                Text("Für diesen Kurs gibt es aktuell keine Buchungen.")
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)

        } else {

            List(
                bookingStore.courseParticipants
            ) { participant in

                HStack(spacing: 12) {

                    Image(systemName: "person.circle.fill")
                        .font(.title2)
                        .foregroundColor(
                            isPastCourse
                            ? .gray
                            : .yogaGold
                        )

                    Text(participant.fullName)
                        .foregroundColor(
                            isPastCourse
                            ? .gray
                            : .primary
                        )

                    Spacer()

                    Image(systemName: "checkmark.circle.fill")
                        .font(.title3)
                        .foregroundColor(
                            isPastCourse
                            ? .gray.opacity(0.75)
                            : .green
                        )
                }
                .padding(.vertical, 4)
                .listRowBackground(
                    Color.white.opacity(
                        isPastCourse ? 0.45 : 0.9
                    )
                )
                .opacity(
                    isPastCourse ? 0.72 : 1
                )
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
            .saturation(
                isPastCourse ? 0.65 : 1
            )
        }
    }
}

// MARK: - Preview

#Preview {

    NavigationStack {

        ParticipantListView(
            courseDate: Date(),
            courseID: UUID(),
            courseTitle: "Morning Flow"
        )
    }
    .environmentObject(BookingStore())
}
