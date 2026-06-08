//
//  ParticipantListView.swift
//  YogaNowStudio
//
//  Created by Kaaatkina on 05.06.26.
//

import SwiftUI

struct ParticipantListView: View {

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

            ScrollView(showsIndicators: false) {

                VStack(spacing: 24) {

                    VStack(spacing: 6) {

                        Text("MORNING FLOW")
                            .font(.caption2)
                            .fontWeight(.semibold)
                            .foregroundColor(.yogaGold)
                            .tracking(2)

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
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }

                    VStack(spacing: 3) {

                        ForEach(participants, id: \.self) { participant in

                            HStack {

                                Circle()
                                    .fill(Color.yogaGold.opacity(0.25))
                                    .frame(width: 42, height: 42)
                                    .overlay {

                                        Image(systemName: "person.fill")
                                            .foregroundColor(.yogaGold)
                                    }

                                Text(participant)
                                    .foregroundColor(.yogaGreen)

                                Spacer()

                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.green)
                            }
                            .padding()
                            
                            .background(Color.white.opacity(0.9))
                            .cornerRadius(18)
                        }
                    }
                }
                .padding()
                .padding(.top, 70)
                .padding(.bottom, 160)
            }

            FooterView(
                selectedTab: .home
            )
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {

    NavigationStack {

        ParticipantListView()

    }.environment(FavoritesStore())
}
