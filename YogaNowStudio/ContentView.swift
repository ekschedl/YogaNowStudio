//
//  ContentView.swift
//  YogaNowStudio
//
//  Created by Kaaatkina on 01.06.26.
//
import SwiftUI

struct ContentView: View {

    var body: some View {

        ZStack {

            Image("BackgroundYoga")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack {

                HStack {

                    Spacer()

                    Button("🌐 DE") {

                    }
                    .padding(.horizontal, 14)
                    .padding(.vertical, 8)
                    .background(.white.opacity(0.8))
                    .clipShape(Capsule())
                }
                .padding()

                Spacer()

                Image("LogoYogaNow")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 340)
                    .padding(.top, 40)

                VStack(spacing: 20) {

                    NavigationCard(

                        title: "Yoga Library",

                        iconName: "IconLibrary"

                    )

                    NavigationCard(

                        title: "Kurse buchen",

                        iconName: "IconCourse"

                    )
                }
                .padding(.top, 20)

                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

