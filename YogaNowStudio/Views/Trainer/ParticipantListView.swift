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

                    Text("\(participants.count) Teilnehmer")
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

                        Image(systemName: "checkmark.circle.fill")
                            .font(.title3)
                            .foregroundColor(.green)

                    }
                }
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
                
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
    }
}

#Preview {

    NavigationStack {

        ParticipantListView(
            courseTitle: "Morning Flow"
        )
    }
}
