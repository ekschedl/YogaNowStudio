import SwiftUI

struct ParticipantListView: View {

    let courseTitle: String

    let participants = [
        "Anna Berger",
        "Lisa Gruber",
        "Sophie Wagner",
        "Julia Huber",
        "Marlene Bauer",
        "Katharina Hofer",
        "Laura Leitner",
        "Emma Schmid",
        "Sarah König",
        "Nina Moser",
        "Lena Fuchs",
        "Maria Weiß"
    ]

    var body: some View {

        ZStack {

            Image("BackgroundYoga")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack(spacing: 0) {

                VStack(spacing: 8) {

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

                    Text("\(participants.count) Teilnehmer")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.top, 20)
                .padding(.bottom, 20)

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
                List(participants, id: \.self) { participant in

                    HStack(spacing: 12) {

                        Image(systemName: "person.circle.fill")
                            .font(.title2)
                            .foregroundColor(.yogaGold)

                        Text(participant)

                        Spacer()
                    }
                }
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
            }
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {

    NavigationStack {

        ParticipantListView(
            courseTitle: "Morning Flow"
        )
    }
}
