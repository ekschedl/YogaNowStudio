//
//  TrainerDayView.swift
//  YogaNowStudio
//
//  Created by Kaaatkina on 05.06.26.
//
import SwiftUI

struct DayView: View {

    var body: some View {

        ZStack {

            Image("BackgroundYoga")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack(spacing: 25) {

                Text("Montag, 08.06.2026")
                    .font(.system(size: 28, weight: .semibold, design: .serif))
                    .foregroundColor(.yogaGreen)

                Text("2 Kurse")
                    .foregroundColor(.gray)

                Spacer()
            }
            .padding(.top, 100)
        }
    }
}

#Preview {
    NavigationStack {
        DayView()
    }
}
