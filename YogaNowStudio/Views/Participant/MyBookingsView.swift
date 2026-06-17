//
//  MyBookingsView.swift
//  YogaNowStudio
//
//  Created by Kaaatkina on 09.06.26.
//
import SwiftUI

struct MyBookingsView: View {

    @EnvironmentObject private var bookingStore: BookingStore

    // MARK: - Date Formatting

    private func formattedDate(
        for booking: Booking
    ) -> String {

        booking.course.date.formatted(
            .dateTime
                .weekday(.wide)
                .day()
                .month(.wide)
                .locale(Locale(identifier: "de_DE"))
        )
    }
    
    var body: some View {

        ZStack {

            Image("BackgroundYoga")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            ScrollView(showsIndicators: false) {

                VStack(spacing: 24) {

                    // MARK: Header

                    VStack(spacing: 8) {
                        Spacer()
                        Spacer()
                        Text("Meine Buchungen")
                            .font(
                                .system(
                                    size: 30,
                                    weight: .semibold,
                                    design: .serif
                                )
                            )
                            .foregroundColor(.yogaGreen)

                        Text("\(bookingStore.bookings.count) AKTIVE KURSE")
                            .font(.caption)
                            .fontWeight(.bold)
                            .tracking(3)
                            .foregroundColor(.yogaGold)
                    }
                    .padding(.top, 80)

                    // MARK: Empty State

                    if bookingStore.bookings.isEmpty {

                        VStack(spacing: 16) {

                            Image(systemName: "calendar.badge.exclamationmark")
                                .font(.system(size: 38))
                                .foregroundColor(.yogaGold)

                            Text("Keine Buchungen")
                                .font(
                                    .system(
                                        size: 28,
                                        weight: .semibold,
                                        design: .serif
                                    )
                                )
                                .foregroundColor(.yogaGreen)

                            Text("Du hast aktuell keine aktiven Kurse gebucht.")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.center)
                        }
                        .padding(30)
                        .frame(maxWidth: .infinity)
                        .background(
                            Color.white.opacity(0.78)
                        )
                        .clipShape(
                            RoundedRectangle(cornerRadius: 28)
                        )

                    } else {

                        ForEach(bookingStore.bookings) { booking in

                            bookingCard(
                                booking: booking
                            )
                        }
                    }

                    Spacer()
                        .frame(height: 100)
                }
                .padding(.horizontal)
                
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }

    // MARK: Booking Card

    private func bookingCard(
        booking: Booking
    ) -> some View {

        VStack(
            alignment: .leading,
            spacing: 14
        ) {

            Text(booking.course.title)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.yogaGreen)

            HStack(spacing: 10) {

                Image(systemName: "calendar")
                    .foregroundColor(.yogaGold)

                Text(formattedDate(for: booking))
                    .foregroundColor(.gray)
            }

            HStack(spacing: 10) {

                Image(systemName: "clock.fill")
                    .foregroundColor(.yogaGold)

                Text(booking.course.time)
                    .foregroundColor(.gray)
            }

            HStack(spacing: 12) {

                NavigationLink {

                    CourseDetailView(
                        role: .participant,
                        imageName: booking.course.imageName,
                        title: booking.course.title,
                        time: booking.course.time,
                        duration: "60 Min.",
                        level: "Alle Levels",
                        trainer: "Laura",
                        description: "Kursbeschreibung",
                        participants: booking.course.participants,
                        maxParticipants: 15,
                        isBooked: true,
                        onShowBookings: {},
                        courseDate: booking.course.date
                    )

                } label: {

                    PrimaryButton(
                        title: "Details",
                        icon: "calendar"
                    )
                }
                Button {

                    Task {
                        await bookingStore.cancel(
                            booking: booking
                        )
                    }

                } label: {

                    SecondaryButton(
                        title: "Stornieren",
                        icon: "xmark"
                    )
                }
            }
        }
        .padding()
        .background(
            LinearGradient(
                colors: [
                    Color.white.opacity(0.95),
                    Color.yogaCream.opacity(0.9)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .clipShape(
            RoundedRectangle(
                cornerRadius: 24
            )
        )
    }
}

#Preview {

    NavigationStack {

        MyBookingsView()
    }
    .environmentObject(BookingStore())
    .environment(FavoritesStore())
}
