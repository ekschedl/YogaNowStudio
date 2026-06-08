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

                VStack(spacing: 20) {

                    HStack {
                        Button {
                        } label: {
                            Image(systemName: "chevron.left")
                                .font(.title3)
                                .foregroundColor(.yogaGreen)
                                .padding(12)
                                .background(.white.opacity(0.9))
                                .clipShape(Circle())
                                .shadow(
                                    color: .black.opacity(0.08),
                                    radius: 6
                                )
                        }
                        Spacer()
                        VStack(spacing: 4) {

                            Text("Juni 2026")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundColor(.yogaGreen)

                            Text("7 geplante Kurse")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Button {
                        } label: {
                            Image(systemName: "chevron.right")
                                .font(.title3)
                                .foregroundColor(.yogaGreen)
                                .padding(12)
                                .background(.white.opacity(0.9))
                                .clipShape(Circle())
                                .shadow(
                                    color: .black.opacity(0.08),
                                    radius: 6
                                )
                        }
                    }
                    .padding(.horizontal)

                    VStack(spacing: 14) {

                        HStack {

                            ForEach(
                                ["Mo","Di","Mi","Do","Fr","Sa","So"],
                                id: \.self
                            ) { day in

                                Text(day)
                                    .font(.caption2)
                                    .foregroundColor(.gray)
                                    .frame(maxWidth: .infinity)
                            }
                        }

                        LazyVGrid(
                            columns: Array(
                                repeating: GridItem(.flexible()),
                                count: 7
                            ),
                            spacing: 14
                        ) {
                            ForEach(1...30, id: \.self) { day in
                                Button {
                                    selectedDay = day
                                } label: {
                                    VStack(spacing: 2) {
                                        if selectedDay == day {
                                            Circle()
                                                .fill(Color.yogaGreen)
                                                .frame(width: 34, height: 34)
                                                .overlay {

                                                    Text("\(day)")
                                                        .font(.caption)
                                                        .fontWeight(.semibold)
                                                        .foregroundColor(.white)
                                                }

                                        } else {

                                            Text("\(day)")
                                                .font(.caption)
                                                .foregroundColor(
                                                    courseDays.contains(day)
                                                    ? .yogaGold
                                                    : .yogaGreen
                                                )
                                                .fontWeight(
                                                    courseDays.contains(day)
                                                    ? .semibold
                                                    : .regular
                                                )
                                                .frame(width: 34, height: 34)
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
                                                .frame(width: 4, height: 4)
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .padding(20)
                    .background(Color.yogaCream)
                    .cornerRadius(24)
                    .shadow(
                        color: .black.opacity(0.05),
                        radius: 8,
                        y: 3
                    )

                    VStack(alignment: .leading, spacing: 4) {

                        Text("\(selectedDay). Juni")
                            .font(.caption)
                            .foregroundColor(.yogaGreen)
                            .tracking(2)
                            

                        Text("Kurse an diesem Tag")
                            .font(
                                .system(
                                    size: 24,
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
                .padding(.top, 50)
                .padding(.bottom, 100)
            }

            FooterView(
                selectedTab: .calendar
            )
        }
    }
}

#Preview {

    NavigationStack {

        NavigationStack {

               CalendarView()

           }

           .environment(FavoritesStore())

    }
}
