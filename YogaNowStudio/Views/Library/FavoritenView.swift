//
//  FavoritenView.swift
//  YogaNowStudio
//
//  Created by Kaaatkina on 04.06.26.
//
import SwiftUI

struct FavoritenView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(FavoritesStore.self) var favorites

    let columns = [
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12)
    ]

    var favoriteVideos: [Video] {
        mockVideos.filter { favorites.isFavorite($0) }
    }

    var body: some View {
        ZStack {
            Image("BackgroundYoga")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack(spacing: 15) {
                Image("LogoYogaNow")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 280)

                Text("Meine Favoriten")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.yogaGreen)

                if favoriteVideos.isEmpty {
                    Spacer()
                    Text("Noch keine Favoriten gespeichert.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 40)
                    Spacer()
                } else {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 12) {
                            ForEach(favoriteVideos) { video in
                                NavigationLink {
                                    VideoDetailView(video: video)
                                } label: {
                                    FlowGridCard(video: video)
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        .padding(.top, 4)
                    }
                }

                Spacer()
            }
            .padding(.horizontal)
            .padding(.top, 30)
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
        FavoritenView()
    }
    .environment(FavoritesStore())
}
