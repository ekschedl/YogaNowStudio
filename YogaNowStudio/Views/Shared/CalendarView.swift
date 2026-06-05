//
//  TrainerCalendarView.swift
//  YogaNowStudio
//
//  Created by Kaaatkina on 05.06.26.
//  !!!    NOCH KEIN ECHTER CALENDER

import SwiftUI

struct CalendarView: View {

    var body: some View {

        ZStack {

            Image("BackgroundYoga")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack(spacing: 25) {

                Text("Kalender")
                    .font(.system(size: 30, weight: .semibold, design: .serif))
                    .foregroundColor(.yogaGreen)

                RoundedRectangle(cornerRadius: 25)
                    .fill(
                        Color(
                            red: 252/255,
                            green: 250/255,
                            blue: 246/255
                        )
                    )
                    .frame(height: 320)
                    .overlay {

                        VStack(spacing: 20) {

                            Text("Juni 2026")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundColor(.yogaGreen)

                            HStack {
                                Text("Mo")
                                Spacer()
                                Text("Di")
                                Spacer()
                                Text("Mi")
                                Spacer()
                                Text("Do")
                                Spacer()
                                Text("Fr")
                                Spacer()
                                Text("Sa")
                                Spacer()
                                Text("So")
                            }
                            .foregroundColor(.gray)

                            LazyVGrid(
                                columns: Array(repeating: GridItem(.flexible()), count: 7),
                                spacing: 15
                            ) {

                                ForEach(1...30, id: \.self) { day in

                                    VStack(spacing: 3) {

                                        Text("\(day)")
                                            .foregroundColor(.yogaGreen)

                                        if [2, 5, 9, 12, 16, 19, 23].contains(day) {

                                            Circle()
                                                .fill(Color.yogaGold)
                                                .frame(width: 6, height: 6)
                                        }
                                    }
                                }
                            }
                        }
                        .padding()
                    }

                VStack(alignment: .leading, spacing: 15) {

                    Text("Heute")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.yogaGreen)

                    NavigationLink {
                        DayView()
                    } label: {

                        VStack(alignment: .leading, spacing: 8) {

                            Text("Morning Flow")
                                .font(.headline)
                                .foregroundColor(.yogaGreen)

                            Text("08:30 - 09:30")
                                .foregroundColor(.gray)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(
                            Color(
                                red: 252/255,
                                green: 250/255,
                                blue: 246/255
                            )
                        )
                        .cornerRadius(20)
                    }

                    NavigationLink {
                        DayView()
                    } label: {

                        VStack(alignment: .leading, spacing: 8) {

                            Text("Yin Yoga")
                                .font(.headline)
                                .foregroundColor(.yogaGreen)

                            Text("17:30 - 18:30")
                                .foregroundColor(.gray)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(
                            Color(
                                red: 252/255,
                                green: 250/255,
                                blue: 246/255
                            )
                        )
                        .cornerRadius(20)
                    }
                }

                Spacer()
            }
            .padding()
            .padding(.horizontal)
            .padding(.top, 50)
        }
    }
}

#Preview {
    NavigationStack {
        CalendarView()
    }
}
