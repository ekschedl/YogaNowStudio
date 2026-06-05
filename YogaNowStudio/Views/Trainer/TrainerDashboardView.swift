import SwiftUI

struct TrainerDashboardView: View {

    var body: some View {

        ZStack(alignment: .bottom) {

            Image("BackgroundYoga")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            ScrollView(showsIndicators: false) {

                VStack(spacing: 16) {

                    HStack {
                        Spacer()
                        Image("LogoYogaNow")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 140)
                    }
        
                    
                    VStack(spacing: 10) {

                        Text("Namasté")
                            .font(.headline)
                            .foregroundColor(.yogaGreen)

                        Text("Valerie")
                            .font(
                                .system(
                                    size: 34,
                                    weight: .semibold,
                                    design: .serif
                                )
                            )
                            .foregroundColor(.yogaGold)

                        Text("3 Kurse heute • 26 Teilnehmer")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .padding(.top, 20)
                    }
              
                    VStack(spacing: 20) {

                        VStack(alignment: .leading, spacing: 4) {

                            Text("Heute")
                                .font(.caption)
                                .foregroundColor(.yogaGold)

                            Text("Dein Kursplan")
                                .font(
                                    .system(
                                        size: 24,
                                        weight: .semibold,
                                        design: .serif
                                    )
                                )
                                .foregroundColor(.yogaGreen)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
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
                                title: "Yin Yoga",
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

                    }
                    .padding(28)
                   
                    .background(
                        Color.yogaCream.opacity(0.95)
                    )
                    .cornerRadius(32)
                    .shadow(
                        color: .black.opacity(0.05),
                        radius: 15,
                        y: 6
                    )
                    .padding(.horizontal)
                    .padding(.top, 40)
                }
           
                .padding(.top, -20)
                .padding(.bottom, 70)
            }

            FooterView()
        }
    }
}

#Preview {

    NavigationStack {

        TrainerDashboardView()
    }
}
