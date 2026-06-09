//
//  MyBookingsView.swift
//  YogaNowStudio
//
//  Created by Kaaatkina on 09.06.26.
//

import SwiftUI

struct MyBookingsView: View {

    var body: some View {

        ZStack {

            Image("BackgroundYoga")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            ScrollView(showsIndicators: false) {

                VStack(spacing: 24) {

                    VStack(spacing: 8) {

                        Text("Meine Buchungen")
                            .font(
                                .system(
                                    size: 30,
                                    weight: .semibold,
                                    design: .serif
                                )
                            )
                            .foregroundColor(.yogaGreen)

                        Text("2 AKTIVE KURSE")
                            .font(.caption)
                            .fontWeight(.bold)
                            .tracking(3)
                            .foregroundColor(.yogaGold)
                    }
                    .padding(.top, 70)

                    bookingCard(
                        title: "Morning Flow",
                        date: "10.06.2026",
                        time: "18:00 Uhr"
                    )

                    bookingCard(
                        title: "Yin Yoga",
                        date: "13.06.2026",
                        time: "17:30 Uhr"
                    )

                    Spacer()
                        .frame(height: 100)
                }
                .padding(.horizontal)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }

    @ViewBuilder
    private func bookingCard(
        title: String,
        date: String,
        time: String
    ) -> some View {
        
        VStack(
            alignment: .leading,
            spacing: 14
        ) {
            
            Text(title)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.yogaGreen)
            
            Text(date)
                .foregroundColor(.gray)
            
            Text(time)
                .foregroundColor(.gray)
            
            HStack {
                
                Button {
                    
                } label: {
                    PrimaryButton(
                        title: "Details",
                        icon: ""
                    )
                }
                Button {
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
                    Color.white,
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
    .environment(FavoritesStore())
}
