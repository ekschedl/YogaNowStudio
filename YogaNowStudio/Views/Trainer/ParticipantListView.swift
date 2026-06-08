//
//  ParticipantListView.swift
//  YogaNowStudio
//
//  Created by Kaaatkina on 05.06.26.
//
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

        ZStack(alignment: .bottom) {

            Image("BackgroundYoga")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack {

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
                }
                .padding(.horizontal)
                .padding(.top, 60)

                Spacer()
            }

            ScrollView(showsIndicators: false) {

                VStack(spacing: 24) {

                    VStack(spacing: 10) {

                        Text(courseTitle.uppercased())
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.yogaGold)
                            .tracking(3)

                        Text("Teilnehmerliste")
                            .font(
                                .system(
                                    size: 32,
                                    weight: .semibold,
                                    design: .serif
                                )
                            )
                            .foregroundColor(.yogaGreen)

                        Text("\(participants.count) Teilnehmer")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }

                 

                    VStack(spacing: 10) {

                        ForEach(participants, id: \.self) { participant in

                            HStack(spacing: 14) {

                                Circle()
                                    .fill(
                                        LinearGradient(
                                            colors: [
                                                Color.yogaGold.opacity(0.35),
                                                Color.yogaGold.opacity(0.15)
                                            ],
                                            startPoint: .top,
                                            endPoint: .bottom
                                        )
                                    )
                                    .frame(width: 48, height: 48)
                                    .overlay {

                                        Image(systemName: "person.fill")
                                            .foregroundColor(.yogaGold)
                                    }

                                VStack(
                                    alignment: .leading,
                                    spacing: 2
                                ) {

                                    Text(participant)
                                        .fontWeight(.medium)
                                        .foregroundColor(.yogaGreen)

                                    Text("Angemeldet")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }

                                Spacer()

                                Circle()
                                    .fill(.green)
                                    .frame(width: 12, height: 12)
                            }
                            .padding()
                            .background(.white.opacity(0.92))
                            .cornerRadius(18)
                            .shadow(
                                color: .black.opacity(0.03),
                                radius: 4,
                                y: 2
                            )
                        }
                    }
                }
                .padding()
                .padding(.top, 70)
                .padding(.bottom, 120)
            }

         
        }
        .navigationBarBackButtonHidden(true)
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
    .environment(FavoritesStore())
}
