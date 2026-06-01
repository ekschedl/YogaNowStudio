//
//  VideoDetailView.swift
//  YogaNowStudio
//
//  Created by Kaaatkina on 02.06.26.
//

import SwiftUI

struct VideoDetailView: View {

    var body: some View {

        ZStack {

            Image("BackgroundYoga")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack(spacing: 20) {

                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white.opacity(0.9))
                    .frame(height: 220)
                    .overlay(
                        Image(systemName: "play.circle.fill")
                            .font(.system(size: 60))
                            .foregroundColor(.yogaGold)
                    )

                Text("Deep Backend Flow")
                    .font(.title2)
                    .foregroundColor(.yogaGreen)

                Text("""
                Öffne dein Herz und verbessere deine Beweglichkeit mit diesem Flow.
                """)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

                Button {

                } label: {

                    Text("Flow im YogaNow Studio erleben")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.yogaGreen)
                        .cornerRadius(15)
                }
                .padding(.horizontal)

                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    VideoDetailView()
}
