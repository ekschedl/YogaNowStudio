//
//  YogaLibraryView.swift
//  YogaNowStudio
//
//  Created by Kaaatkina on 01.06.26.
//
import SwiftUI

struct YogaLibraryView: View {

    @State private var searchText = ""

    var body: some View {

        ZStack {

            Image("BackgroundYoga")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack(spacing: 15) {

                Text("Yoga Library")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.yogaGreen)
                
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    TextField("Kurse suchen...", text: $searchText)
                }

                .padding()
                .background(Color.white.opacity(0.9))
                .cornerRadius(20)
                .padding(.horizontal)
                
                HStack(spacing: 10) {
                    FilterButton(title: "Anfänger")
                    FilterButton(title: "Fortgeschritten")
                    FilterButton(title: "Profi")
                }
                
                ScrollView {

                    VStack(spacing: 15) {

                        VideoCard(
                            title: "Deep Backend Flow",
                            level: "Profi",
                            duration: "60 Min"
                        )

                        VideoCard(
                            title: "Arm Balance Workshop",
                            level: "Fortgeschritten"
                        ,
                            duration: "45 Min"
                        )

                        VideoCard(
                            title: "Inversion Flow",
                            level: "Profi",
                            duration: "50 Min"
                        )

                    }
                    .padding(.top)
                }
                .padding(.horizontal)

                Spacer()

            }
            .padding(.top, 50)
        }
    }
}

#Preview {
    YogaLibraryView()
}
