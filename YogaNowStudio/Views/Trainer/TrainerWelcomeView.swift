import SwiftUI

struct TrainerWelcomeView: View {

    var body: some View {

        ZStack {

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
                        Spacer()
                        Text("Namasté, Valerie")
                            .font(
                                .system(
                                    size: 28,
                                    weight: .semibold,
                                    design: .serif
                                )
                            )
                            .foregroundColor(.yogaGold)

                        Spacer()

                        Text("Deine Gruppen heute")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.yogaGreen)
                            .frame(maxWidth: .infinity, alignment: .leadingFirstTextBaseline)

                        NavigationLink {
                            DayView()
                        } label: {

                            HStack(spacing: 12) {
                                Image("ImageCourse01")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 120, height: 90)
                                    .clipped()
                                    .cornerRadius(15)
                                
                                VStack(
                                    alignment: .leading,
                                    spacing: 10
                                ) {
                                    Text("Morning Flow")
                                        .font(.headline)
                                        .foregroundColor(.yogaGreen)
                                    Text("08:30 Uhr")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                    
                                    HStack(spacing: 6) {

                                        Image(systemName: "person.2.fill")

                                        Text("x 12")
                                    }
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                }

                                Spacer()

                                Image(systemName: "chevron.right")
                                    .foregroundColor(.yogaGold)
                            }
                            .padding(12)
                            .background(Color.white.opacity(0.85))
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(
                                        Color.yogaGold.opacity(0.15),
                                        lineWidth: 1
                                    )
                            )
                            .cornerRadius(20)
                        }

                        NavigationLink {

                            DayView()

                        } label: {

                            HStack(spacing: 12) {

                                Image("ImageCourse02")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 120, height: 90)
                                    .clipped()
                                    .cornerRadius(15)

                                VStack(
                                    alignment: .leading,
                                    spacing: 10
                                ) {

                                    Text("Evening Flow")
                                        .font(.headline)
                                        .foregroundColor(.yogaGreen)

                                    Text("17:30 Uhr")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)

                                    HStack(spacing: 6) {

                                        Image(systemName: "person.2.fill")

                                        Text("x 6")
                                    }
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                }

                                Spacer()

                                Image(systemName: "chevron.right")
                                    .foregroundColor(.yogaGold)
                            }
                            .padding(12)
                            .background(Color.white.opacity(0.85))
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(
                                        Color.yogaGold.opacity(0.15),
                                        lineWidth: 1
                                    )
                            )
                            .cornerRadius(20)
                        }

                        NavigationLink {

                            DayView()

                        } label: {

                            HStack(spacing: 12) {

                                Image("ImageCourse03")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 120, height: 90)
                                    .clipped()
                                    .cornerRadius(15)

                                VStack(
                                    alignment: .leading,
                                    spacing: 10
                                ) {

                                    Text("Deep Balance")
                                        .font(.headline)
                                        .foregroundColor(.yogaGreen)

                                    Text("19:00 Uhr")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)

                                    HStack(spacing: 6) {

                                        Image(systemName: "person.2.fill")

                                        Text("x 8")
                                    }
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                }

                                Spacer()

                                Image(systemName: "chevron.right")
                                    .foregroundColor(.yogaGold)
                            }
                            .padding(12)
                            .background(Color.white.opacity(0.85))
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(
                                        Color.yogaGold.opacity(0.15),
                                        lineWidth: 1
                                    )
                            )
                            .cornerRadius(20)
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
                }
                .padding(.vertical)
            }
        }
    }
}

#Preview {
    NavigationStack {
        TrainerWelcomeView()
    }
}
