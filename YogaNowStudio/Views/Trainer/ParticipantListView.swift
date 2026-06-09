import SwiftUI

struct ParticipantListView: View {

    @Environment(\.dismiss) private var dismiss

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

                HStack {

                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.title3)
                            .foregroundColor(.yogaGreen)
                            .padding(12)
                            .background(.white.opacity(0.9))
                            .clipShape(Circle())
                    }

                    Spacer()

                    VStack(spacing: 8) {

                        Text(courseTitle.uppercased())
                            .font(.caption)
                            .fontWeight(.semibold)
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
                    .padding(.bottom, 20)

                    Spacer()

                    Color.clear
                        .frame(width: 20)
                }
                .padding()

                List(participants, id: \.self) { participant in

                    HStack {

                        Image(systemName: "person.circle.fill")
                            .font(.title2)
                            .foregroundColor(.yogaGold)

                        Text(participant)

                        Spacer()
                    }
                }
                .listStyle(.plain)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
