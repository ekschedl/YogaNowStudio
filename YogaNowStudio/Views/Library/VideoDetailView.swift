//
//  VideoDetailView.swift
//  YogaNowStudio
//
//  Created by Kaaatkina on 02.06.26.
//

import SwiftUI

struct VideoDetailView: View {

    let video: Video

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

                Text(video.title)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.yogaGreen)

                Text(video.subtitle)
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
                .padding(30)

                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    VideoDetailView(video: mockVideos[0])
}
