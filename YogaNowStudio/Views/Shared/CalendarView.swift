//
//  TrainerCalendarView.swift
//  YogaNowStudio
//
//  Created by Kaaatkina on 05.06.26.
//  !!!    NOCH KEIN ECHTER CALENDER

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

                    VStack(spacing: 4) {

                        Text("Dein Kalender")
                            .font(
                                .system(
                                    size: 30,
                                    weight: .semibold,
                                    design: .serif
                                )
                            )
                            .foregroundColor(.yogaGreen)
                    }

                    HStack {

                        Button {

                        } label: {

                            Image(systemName: "chevron.left")
                                .foregroundColor(.yogaGreen)
                                .font(.headline)
                        }

                        Spacer()

                        Text("JUNI 2026")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.yogaGreen)
                            .tracking(2)

                        Spacer()

                        Button {

                        } label: {

                            Image(systemName: "chevron.right")
                                .foregroundColor(.yogaGreen)
                                .font(.headline)
                        }
                    }
                    .padding(.horizontal)

                    VStack(spacing: 20) {

                        HStack {

                            ForEach(
                                ["Mo","Di","Mi","Do","Fr","Sa","So"],
                                id: \.self
                            ) { day in

                                Text(day)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                    .frame(maxWidth: .infinity)
                            }
                        }

                        LazyVGrid(
                            columns: Array(
                                repeating: GridItem(.flexible()),
                                count: 7
                            ),
                            spacing: 18
                        ) {

                            ForEach(1...30, id: \.self) { day in

                                Button {

                                    selectedDay = day

                                } label: {

                                    VStack(spacing: 4) {

                                        if selectedDay == day {

                                            Circle()
                                                .fill(Color.yogaGreen)
                                                .frame(
                                                    width: 38,
                                                    height: 38
                                                )
                                                .overlay {

                                                    Text("\(day)")
                                                        .foregroundColor(.white)
                                                        .fontWeight(.semibold)
                                                }

                                        } else {

                                            Text("\(day)")
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
                                                .frame(
                                                    width: 38,
                                                    height: 38
                                                )
                                                .background(
                                                    courseDays.contains(day)
                                                    ? Color.yogaGold.opacity(0.12)
                                                    : Color.clear
                                                )
                                                .clipShape(Circle())
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .padding(24)
                    .background(Color.yogaCream)
                    .cornerRadius(32)
                    .shadow(
                        color: .black.opacity(0.05),
                        radius: 12,
                        y: 4
                    )

                    VStack(
                        alignment: .leading,
                        spacing: 4
                    ) {

                        Text("\(selectedDay). JUNI")
                            .font(.caption)
                            .foregroundColor(.yogaGold)
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

                        DayView()

                    } label: {

                        HStack {

                            VStack(
                                alignment: .leading,
                                spacing: 6
                            ) {

                                Text("Morning Flow")
                                    .font(.headline)
                                    .foregroundColor(.yogaGreen)

                                Text("08:30 - 09:30")
                                    .foregroundColor(.gray)
                            }

                            Spacer()

                            Image(
                                systemName: "chevron.right"
                            )
                            .foregroundColor(.yogaGold)
                        }
                        .padding()
                        .background(Color.yogaCream)
                        .cornerRadius(22)
                    }

                    NavigationLink {

                        DayView()

                    } label: {

                        HStack {

                            VStack(
                                alignment: .leading,
                                spacing: 6
                            ) {

                                Text("Yin Yoga")
                                    .font(.headline)
                                    .foregroundColor(.yogaGreen)

                                Text("17:30 - 18:30")
                                    .foregroundColor(.gray)
                            }

                            Spacer()

                            Image(
                                systemName: "chevron.right"
                            )
                            .foregroundColor(.yogaGold)
                        }
                        .padding()
                        .background(Color.yogaCream)
                        .cornerRadius(22)
                    }

                    NavigationLink {

                        DayView()

                    } label: {

                        HStack {

                            VStack(
                                alignment: .leading,
                                spacing: 6
                            ) {

                                Text("Deep Balance")
                                    .font(.headline)
                                    .foregroundColor(.yogaGreen)

                                Text("19:00 - 20:00")
                                    .foregroundColor(.gray)
                            }

                            Spacer()

                            Image(
                                systemName: "chevron.right"
                            )
                            .foregroundColor(.yogaGold)
                        }
                        .padding()
                        .background(Color.yogaCream)
                        .cornerRadius(22)
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

        CalendarView()

    }

}
