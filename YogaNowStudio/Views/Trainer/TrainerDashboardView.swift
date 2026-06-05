import SwiftUI

struct TrainerDashboardView: View {

    var body: some View {

        ZStack(alignment: .bottom) {

            Image("BackgroundYoga")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            ScrollView(showsIndicators: false) {

                VStack() {

                    HStack {
                        Spacer()
                        Image("LogoYogaNow")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100)
                            .padding(.top, 20)
                    }
        
                    
                    VStack(spacing: 4) {
                        Text("Namasté")
                            .font(.subheadline)
                            .foregroundColor(.yogaGreen)
                        
                        Text("Valerie")
                            .font(
                                .system(
                                    size: 32,
                                    weight: .bold,
                                    design: .serif
                                )
                            )
                            .foregroundColor(.yogaGold)

                        Text("3 Kurse heute • 26 Teilnehmer")
                            .font(.footnote)
                            .foregroundColor(.gray.opacity(0.9))
                    }
                   
                    VStack(spacing: 20) {
                        VStack(alignment: .leading, spacing: 2) {
                            Text("HEUTE")
                                .font(.caption2)
                                .fontWeight(.medium)
                                .foregroundColor(.yogaGold)
                                .tracking(2)

                            Text("Dein Kursplan")
                                .font(
                                    .system(
                                        size: 28,
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
                    .padding(24)
                    .background(Color.yogaCream.opacity(0.97))
                    .cornerRadius(36)
                    .shadow(
                        color: .black.opacity(0.04),
                        radius: 12,
                        y: 4
                    )
                    .padding(.horizontal)
                }
                .padding(.top, -20)
                .padding(.bottom, 110)
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
