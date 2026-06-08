//
//  AsanasView.swift
//  YogaNowStudio
//
//  Created by Kaaatkina on 07.06.26.
//
import SwiftUI

struct AsanasView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack {
            Image("BackgroundYoga")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack(spacing: 10) {
                Image("LogoYogaNow")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)

                Text("ASANAS")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.yogaGreen)
                    .tracking(4)

                Text("Master the Basics")
                    .font(.subheadline)
                    .italic()
                    .foregroundColor(.yogaGold)

                Spacer()

                Text("Inhalte folgen in Kürze.")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)

                Spacer()
            }
            .padding(.horizontal)
            .padding(.top, 8)
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    HStack(spacing: 4) {
                        Image(systemName: "chevron.left")
                        Text("Zurück")
                    }
                    .foregroundColor(.yogaGreen)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        AsanasView()
    }.environment(FavoritesStore())
}


