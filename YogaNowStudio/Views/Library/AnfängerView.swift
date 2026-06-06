//
//  AnfängerView.swift
//  YogaNowStudio
//
//  Created by Kaaatkina on 04.06.26.
//
import SwiftUI

struct AnfängerView: View {
    @Environment(\.dismiss) private var dismiss

    @State private var searchText = ""

    let columns = [
        GridItem(.flexible(), spacing: 12),
        GridItem(.flexible(), spacing: 12)
    ]

    var filteredVideos: [Video] {
        let beginner = mockVideos.filter { $0.level == "Anfänger" }
        if searchText.isEmpty { return beginner }
        return beginner.filter {
            $0.title.localizedCaseInsensitiveContains(searchText)
        }
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

                Text("Anfänger")
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

                ScrollView {
                    LazyVGrid(columns: columns, spacing: 12) {
                        ForEach(filteredVideos) { video in
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
        AnfängerView()
    }
    .environment(FavoritesStore())
}
