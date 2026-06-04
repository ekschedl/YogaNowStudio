//
//  YogaLibraryView.swift
//  YogaNowStudio

//  Created by Kaaatkina on 01.06.26.
//
import SwiftUI

struct YogaLibraryView: View {
    @Environment(\.dismiss) private var dismiss

    @State private var searchText = ""

    var filteredVideos: [Video] {

        if searchText.isEmpty {
            return mockVideos
        }

        return mockVideos.filter {
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

                HStack(spacing: 15) {

                    NavigationLink {
                        AnfängerView()
                    } label: {
                        FilterButton(title: "Anfänger")
                    }
                    .buttonStyle(.plain)

                    NavigationLink {
                        FortgeschrittenView()
                    } label: {
                        FilterButton(title: "Fortgeschritten")
                    }
                    .buttonStyle(.plain)

                    NavigationLink {
                        ProfiView()
                    } label: {
                        FilterButton(title: "Profi")
                    }
                    .buttonStyle(.plain)
                }

                ScrollView {

                    VStack(spacing: 15) {

                        ForEach(filteredVideos) { video in
                            NavigationLink {
                                VideoDetailView()
                            } label: {
                                VideoCard(video: video)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding(.top)
                }
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top, 30)
            
        }
    }
}

#Preview {
    NavigationStack {
        YogaLibraryView()
    }
}
