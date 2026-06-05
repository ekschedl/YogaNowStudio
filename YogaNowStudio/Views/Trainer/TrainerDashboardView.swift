import SwiftUI

struct TrainerDashboardView: View {

    var body: some View {

        ZStack(alignment: .bottom) {

            Image("BackgroundYoga")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            ScrollView(showsIndicators: false) {

                VStack(spacing: 10) {

                    Image("LogoYogaNow")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 260)

                    VStack(spacing: 18) {

                        Text("Namasté, Valerie")
                            .font(
                                .system(
                                    size: 28,
                                    weight: .semibold,
                                    design: .serif
                                )
                            )
                            .foregroundColor(.yogaGold)

                        Text("Deine Gruppen heute")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.yogaGreen)
                            .frame(
                                maxWidth: .infinity,
                                alignment: .leading
                            )

                        NavigationLink {
                            DayView()
                        } label: {
                            CourseCardView(
                                imageName: "ImageCourse01",
                                title: "Morning Flow",
                                time: "08:30 Uhr",
                                participants: 12
                            )
                        }

                        NavigationLink {
                            DayView()
                        } label: {
                            CourseCardView(
                                imageName: "ImageCourse02",
                                title: "Evening Flow",
                                time: "17:30 Uhr",
                                participants: 6
                            )
                        }

                        NavigationLink {
                            DayView()
                        } label: {
                            CourseCardView(
                                imageName: "ImageCourse03",
                                title: "Deep Balance",
                                time: "19:00 Uhr",
                                participants: 8
                            )
                        }

                        NavigationLink {
                            CalendarView()
                        } label: {
                            HStack {
                                Image(systemName: "calendar")
                                Text("Kalender öffnen")
                            }
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 16)
                            .background(Color.yogaGreen)
                            .cornerRadius(14)
                        }
                    }
                    .padding(30)
                    .background(
                        Color(
                            red: 254/255,
                            green: 253/255,
                            blue: 250/255
                        )
                    )
                    .cornerRadius(30)
                    .shadow(
                        color: Color.yogaGold.opacity(0.08),
                        radius: 20,
                        y: 8
                    )
                    .padding(.horizontal)
                    .offset(y: -30)
                }
             
            
            }

            FooterView()
                .zIndex(1000)
        }
    }
}

#Preview {
    NavigationStack {
        TrainerDashboardView()
    }
}
