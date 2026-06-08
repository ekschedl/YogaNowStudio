import SwiftUI

struct CourseDetailView: View {

    @Environment(\.dismiss) private var dismiss

    let role: UserRole
    let imageName: String
    let title: String
    let time: String
    let duration: String
    let level: String
    let trainer: String
    let description: String
    let participants: Int
    let maxParticipants: Int

    var body: some View {

        ZStack(alignment: .bottom) {

            ScrollView {

                VStack(spacing: 0) {

                    ZStack(alignment: .top) {

                        Image(imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 280)
                            .clipped()

                        HStack {

                            Button {
                                dismiss()
                            } label: {

                                Image(systemName: "chevron.left")
                                    .font(.title3)
                                    .foregroundColor(.yogaGold)
                                    .padding(12)
                                    .background(.white.opacity(0.9))
                                    .clipShape(Circle())
                            }

                            Spacer()
                        }
                        .padding(.horizontal)
                        .padding(.top, 60)
                    }

                    VStack(alignment: .leading, spacing: 20) {

                        Text(title)
                            .font(
                                .system(
                                    size: 30,
                                    weight: .semibold,
                                    design: .serif
                                )
                            )
                            .foregroundColor(.yogaGreen)

                        HStack(spacing: 25) {

                            Label(
                                time,
                                systemImage: "clock"
                            )

                            Label(
                                duration,
                                systemImage: "timer"
                            )
                        }
                        .foregroundColor(.gray)

                        HStack {

                            VStack(
                                alignment: .leading,
                                spacing: 5
                            ) {

                                Text("Level")
                                    .foregroundColor(.gray)
                                Text(level)
                            }

                            Spacer()

                            VStack(
                                alignment: .leading,
                                spacing: 5
                            ) {

                                Text("Trainer")
                                    .foregroundColor(.gray)
                                Text(trainer)
                            }
                        }

                        Divider()

                        Text(description)
                            .foregroundColor(.primary)

                        Divider()

                        if role == .participant {

                            HStack {

                                Text("Freie Plätze")

                                Spacer()

                                Text(
                                    "\(maxParticipants - participants) von \(maxParticipants)"
                                )
                            }

                            Button {

                            } label: {

                                HStack {

                                    Image(
                                        systemName: "calendar.badge.plus"
                                    )

                                    Text("Kurs buchen")
                                }
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.yogaGreen)
                                .cornerRadius(14)
                            }

                        } else {

                            HStack {
                                Text("Teilnehmer")
                                Spacer()
                                Text(
                                    "\(participants) Teilnehmer"
                                )
                            }

                            NavigationLink {
                                Text("Teilnehmerliste")

                            } label: {
                                HStack {
                                    Image(
                                        systemName: "person.2.fill"
                                    )
                                    Text("Teilnehmer anzeigen")
                                }
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.yogaGreen)
                                .cornerRadius(14)
                            }
                        }
                    }
                    .padding(40)
                    .background(.white.opacity(0.9))
                
                }
    
            }

        
                FooterView(
                    selectedTab: .home
                )
            
        }
        .navigationBarTitle(
            "",
            displayMode: .inline
        )
        .ignoresSafeArea(edges: .top)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {

    NavigationStack {
        CourseDetailView(
            role: .trainer,
            imageName: "ImageCourse01",
            title: "Morning Flow",
            time: "08:30 - 09:30",
            duration: "60 Min.",
            level: "Alle Levels",
            trainer: "Laura",
            description: "Starte deinen Tag mit einer belebenden Yoga-Praxis für Körper und Geist. Für alle Levels geeignet.",
            participants: 12,
            maxParticipants: 15
        )
    }.environment(FavoritesStore())
}
