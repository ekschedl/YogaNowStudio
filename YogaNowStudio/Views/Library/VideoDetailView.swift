//
//  VideoDetailView.swift
//  YogaNowStudio
//
//  Created by Kaaatkina on 02.06.26.
//

import SwiftUI

struct VideoDetailView: View {

    let video: Video
    @Environment(\.dismiss) private var dismiss

    var leafCount: Int {
        switch video.level {
        case "Anfänger":        return 1
        case "Fortgeschritten": return 2
        case "Profi":           return 3
        default:                return 1
        }
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {

                // Video-Player Bereich
                ZStack {
                    Image(video.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 210)
                        .clipped()
                        .cornerRadius(20)

                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.black.opacity(0.25))
                        .frame(height: 210)

                    Image(systemName: "play.circle.fill")
                        .font(.system(size: 60))
                        .foregroundColor(.white.opacity(0.9))
                }
                .shadow(color: .black.opacity(0.2), radius: 10)

                // Titel & Info
                VStack(spacing: 10) {
                    Text(video.title)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.yogaGreen)
                        .multilineTextAlignment(.center)

                    HStack(spacing: 20) {
                        Label(video.duration, systemImage: "clock")
                            .font(.subheadline)
                            .foregroundColor(.gray)

                        HStack(spacing: 3) {
                            ForEach(0..<leafCount, id: \.self) { _ in
                                Image(systemName: "leaf.fill")
                                    .foregroundColor(.yogaGold)
                                    .font(.subheadline)
                            }
                            Text(video.level)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }

                // Beschreibung
                Text(video.subtitle)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)

                Divider()

                // Was dich erwartet
                VStack(alignment: .leading, spacing: 10) {
                    Text("Was dich erwartet")
                        .font(.headline)
                        .foregroundColor(.yogaGreen)

                    ForEach(["Geführte Atemübungen", "Schritt-für-Schritt Anleitung", "Angepasst an dein Level"], id: \.self) { punkt in
                        HStack(spacing: 10) {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.yogaGold)
                            Text(punkt)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(Color.white.opacity(0.85))
                .cornerRadius(16)

                // CTA Button
                NavigationLink {
                    LoginView()
                } label: {
                    Text("Flow im YogaNow Studio erleben")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.yogaGreen)
                        .cornerRadius(15)
                }
                .buttonStyle(.plain)
                .padding(.bottom, 30)
            }
            .padding(.horizontal)
            .padding(.top, 12)
        }
        .background {
            Image("BackgroundYoga")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    HStack(spacing: 4) {
                        Image(systemName: "chevron.left")
                                            }
                    .foregroundColor(.yogaGreen)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        VideoDetailView(video: mockVideos[0])
    }.environment(FavoritesStore())
}
