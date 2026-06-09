import SwiftUI

struct CalendarView: View {

    @State private var selectedDay = 12

    let courseDays = [2, 5, 9, 12, 16, 19, 23]

    var body: some View {

        ZStack(alignment: .bottom) {

            Image("BackgroundYoga")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            ScrollView(showsIndicators: false) {

                VStack(spacing: 24) {

                    // MARK: Header

            

                    // MARK: Kalenderkarte

                    VStack(spacing: 20) {

                        HStack {

                            Button {

                            } label: {

                                Image(systemName: "chevron.left")
                                    .foregroundColor(.yogaGreen)
                                    .padding(10)
                                    .background(.white.opacity(0.9))
                                    .clipShape(Circle())
                            }

                            Spacer()

                            Text("Juni")
                                .font(.headline)
                                .foregroundColor(.yogaGreen)

                            Spacer()

                            Button {

                            } label: {

                                Image(systemName: "chevron.right")
                                    .foregroundColor(.yogaGreen)
                                    .padding(10)
                                    .background(.white.opacity(0.9))
                                    .clipShape(Circle())
                            }
                        }

                        HStack {

                            ForEach(
                                ["Mo","Di","Mi","Do","Fr","Sa","So"],
                                id: \.self
                            ) { day in

                                Text(day)
                                    .font(.caption2)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.gray)
                                    .frame(maxWidth: .infinity)
                            }
                        }

                        LazyVGrid(
                            columns: Array(
                                repeating: GridItem(.flexible()),
                                count: 7
                            ),
                            spacing: 16
                        ) {

                            ForEach(1...30, id: \.self) { day in

                                Button {

                                    selectedDay = day

                                } label: {

                                    VStack(spacing: 4) {

                                        if selectedDay == day {

                                            Circle()
                                                .fill(Color.yogaGreen)
                                                .frame(width: 40, height: 40)
                                                .overlay {

                                                    Text("\(day)")
                                                        .fontWeight(.bold)
                                                        .foregroundColor(.white)
                                                }

                                        } else {

                                            Text("\(day)")
                                                .foregroundColor(
                                                    courseDays.contains(day)
                                                    ? .yogaGold
                                                    : .yogaGreen
                                                )
                                                .frame(width: 40, height: 40)
                                                .background(
                                                    courseDays.contains(day)
                                                    ? Color.yogaGold.opacity(0.12)
                                                    : Color.clear
                                                )
                                                .clipShape(Circle())
                                        }

                                        if courseDays.contains(day) {

                                            Circle()
                                                .fill(Color.yogaGold)
                                                .frame(width: 5, height: 5)
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .padding(24)
                    .background(
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color.yogaCream.opacity(0.96))
                    )
                    .shadow(
                        color: .black.opacity(0.08),
                        radius: 15,
                        y: 5
                    )

                    // MARK: Kurse Header

                    VStack(
                        alignment: .leading,
                        spacing: 6
                    ) {

                        Text("\(selectedDay). Juni")
                            .font(.caption)
                            .tracking(3)
                            .foregroundColor(.yogaGold)

                        Text("Deine Kurse")
                            .font(
                                .system(
                                    size: 28,
                                    weight: .semibold,
                                    design: .serif
                                )
                            )
                            .foregroundColor(.yogaGreen)
                    }
                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )

                    // MARK: Kurse

                    NavigationLink {

                        CourseDetailView(
                            role: .trainer,
                            imageName: "ImageCourse01",
                            title: "Morning Flow",
                            time: "08:30 - 09:30",
                            duration: "60 Min.",
                            level: "Alle Levels",
                            trainer: "Laura",
                            description: "Starte deinen Tag mit einer belebenden Yoga-Praxis für Körper und Geist.",
                            participants: 12,
                            maxParticipants: 15
                        )

                    } label: {

                        CourseCardView(
                            imageName: "ImageCourse01",
                            title: "Morning Flow",
                            time: "08:30 Uhr",
                            participants: 12
                        )
                    }

                    NavigationLink {

                        CourseDetailView(
                            role: .trainer,
                            imageName: "ImageCourse02",
                            title: "Yin Yoga",
                            time: "17:30 - 18:30",
                            duration: "60 Min.",
                            level: "Anfänger",
                            trainer: "Sarah",
                            description: "Sanfte Yoga-Einheit für Entspannung und Beweglichkeit.",
                            participants: 6,
                            maxParticipants: 12
                        )

                    } label: {

                        CourseCardView(
                            imageName: "ImageCourse02",
                            title: "Yin Yoga",
                            time: "17:30 Uhr",
                            participants: 6
                        )
                    }

                    NavigationLink {

                        CourseDetailView(
                            role: .trainer,
                            imageName: "ImageCourse03",
                            title: "Deep Balance",
                            time: "19:00 - 20:00",
                            duration: "60 Min.",
                            level: "Fortgeschritten",
                            trainer: "Emma",
                            description: "Balance, Kraft und Fokus für Körper und Geist.",
                            participants: 8,
                            maxParticipants: 12
                        )

                    } label: {

                        CourseCardView(
                            imageName: "ImageCourse03",
                            title: "Deep Balance",
                            time: "19:00 Uhr",
                            participants: 8
                        )
                    }
                }
                .padding(.horizontal)
                .padding(.top, 20)
                .padding(.bottom, 140)
            }

            FooterView(
                selectedTab: .calendar
            )
        }
     
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    NavigationStack {
        CalendarView()
    }
    .environment(FavoritesStore())
}
