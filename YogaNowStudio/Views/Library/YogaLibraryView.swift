//
//  YogaLibraryView.swift
//  YogaNowStudio

//  Created by Kaaatkina on 01.06.26.
//
import SwiftUI

struct YogaLibraryView: View {

    func lastVideo(for level: String) -> Video? {
        mockVideos.filter { $0.level == level }.last
    }

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
                    .padding(.top, 20)

                Text("Yoga Library")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.yogaGreen)
                    .padding(.top, -20)

                // ASANAS Banner
                NavigationLink {
                    AsanasView()
                } label: {
                  VStack(spacing: 2) {
                    Text("ASANAS")
                      .font(.subheadline)
                      .fontWeight(.bold)
                      .foregroundColor(.white)
                      .tracking(4)
                    Text("Master the Basics")
                      .font(.caption2)
                      .italic()
                      .foregroundColor(Color(red: 255/255, green: 235/255, blue: 195/255))
                  }
                  .frame(maxWidth: .infinity)
                  .padding(.vertical, 15)
                    .shadow(color: .black.opacity(0.12), radius: 5, y: 2)
                    .background(RoundedRectangle(cornerRadius: 14)
                      .fill(
                        LinearGradient(
                          colors: [
                            Color(red: 160/255, green: 118/255, blue: 75/255),
                            Color(red: 196/255, green: 158/255, blue: 110/255)
                          ],
                          startPoint: .leading,
                          endPoint: .trailing
                        )
                      ))
                }
                .buttonStyle(.plain)


                VStack(spacing: 6) {
                    Text("Unsere aktuellsten Flows")
                        .font(.custom("Georgia", size: 16))
                        .foregroundColor(.yogaGreen)
                        .frame(maxWidth: .infinity, alignment: .center)

                    HStack(spacing: 6) {
                        Rectangle()
                            .fill(Color.yogaGold.opacity(0.7))
                            .frame(height: 0.8)
                        Image(systemName: "leaf.fill")
                            .font(.system(size: 7))
                            .foregroundColor(.yogaGold.opacity(0.8))
                        Rectangle()
                            .fill(Color.yogaGold.opacity(0.7))
                            .frame(height: 0.8)
                    }
                }
                .padding(.top, 10)

                VStack(spacing: 16) {
                    HStack(alignment: .top, spacing: 16) {
                        LibraryCell(
                            flowTitle: "Anfänger Flows",
                            destination: AnfängerView(),
                            video: lastVideo(for: "Anfänger")
                        )
                        LibraryCell(
                            flowTitle: "Fortgeschrittenen Flows",
                            destination: FortgeschrittenView(),
                            video: lastVideo(for: "Fortgeschritten")
                        )
                    }
                    HStack(alignment: .top, spacing: 16) {
                        LibraryCell(
                            flowTitle: "Profi Flows",
                            destination: ProfiView(),
                            video: lastVideo(for: "Profi")
                        )
                        FavoritenCell()
                    }
                }
                .padding(.top, 4)

                Spacer()
            }
            .padding(.horizontal)
            .padding(.top, 8)
        }
    }
}

// MARK: - LibraryCell

private struct LibraryCell<Destination: View>: View {
    let topLabel: String
    let flowTitle: String
    let destination: Destination
    let video: Video?

    init(flowTitle: String, destination: Destination, video: Video?) {
        self.topLabel = "zu allen"
        self.flowTitle = flowTitle
        self.destination = destination
        self.video = video
    }

    var body: some View {
        VStack(spacing: 0) {
            if let video {
                NavigationLink {
                    VideoDetailView(video: video)
                } label: {
                    FlowGridCard(video: video, embedded: true)
                }
                .buttonStyle(.borderless)
            }

            NavigationLink {
                destination
            } label: {
                VStack(spacing: 1) {
                    Text(topLabel)
                        .italic()
                        .font(.caption2)
                        .foregroundColor(.yogaGreen.opacity(0.8))
                    Text(flowTitle)
                        .font(.caption2)
                        .fontWeight(.semibold)
                        .foregroundColor(.yogaGreen)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 7)
                .background(Color(red: 245/255, green: 242/255, blue: 236/255))
            }
            .buttonStyle(.borderless)
        }
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: .black.opacity(0.07), radius: 5)
        .frame(maxWidth: .infinity)
    }
}

// MARK: - FavoritenCell

private struct FavoritenCell: View {
    @Environment(FavoritesStore.self) var favorites

    let columns = [
        GridItem(.flexible(), spacing: 4),
        GridItem(.flexible(), spacing: 4)
    ]

    var slots: [Video?] {
        let recent = favorites.recentVideos(from: mockVideos)
        return (recent.map { Optional($0) } + [nil, nil, nil, nil]).prefix(4).map { $0 }
    }

    var body: some View {
        VStack(spacing: 0) {
            LazyVGrid(columns: columns, spacing: 4) {
                ForEach(0..<4, id: \.self) { i in
                    if let video = slots[i] {
                        NavigationLink {
                            VideoDetailView(video: video)
                        } label: {
                            MiniFlowCard(video: video)
                        }
                        .buttonStyle(.borderless)
                    } else {
                        MiniFlowCardEmpty()
                    }
                }
            }
            .padding(6)
            .background(Color.white.opacity(0.95))

            NavigationLink {
                FavoritenView()
            } label: {
                VStack(spacing: 1) {
                    Text("meine")
                        .italic()
                        .font(.caption2)
                        .foregroundColor(.yogaGreen.opacity(0.8))
                    Text("Favoriten")
                        .font(.caption2)
                        .fontWeight(.semibold)
                        .foregroundColor(.yogaGreen)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 7)
                .background(Color(red: 245/255, green: 242/255, blue: 236/255))
            }
            .buttonStyle(.borderless)
        }
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: .black.opacity(0.07), radius: 5)
        .frame(maxWidth: .infinity)
    }
}

// MARK: - MiniFlowCard

private struct MiniFlowCard: View {
    let video: Video

    var leafCount: Int {
        switch video.level {
        case "Anfänger":        return 1
        case "Fortgeschritten": return 2
        case "Profi":           return 3
        default:                return 1
        }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Group {
                if let localName = video.localVideoName {
                    LocalVideoThumbnailView(videoName: localName, fallbackImage: video.imageName, overlayText: video.localVideoOverlay, overlayAtBottom: video.localVideoOverlayBottom)
                } else if let youtubeID = video.youtubeID {
                    AsyncImage(url: URL(string: "https://img.youtube.com/vi/\(youtubeID)/hqdefault.jpg")) { image in
                        image.resizable().scaledToFill()
                    } placeholder: {
                        Image(video.imageName).resizable().scaledToFill()
                    }
                } else {
                    Image(video.imageName).resizable().scaledToFill()
                }
            }
            .frame(height: 55)
            .clipped()

            VStack(alignment: .leading, spacing: 2) {
                Text(video.title)
                    .font(.system(size: 9, weight: .bold))
                    .foregroundColor(.yogaGreen)
                    .lineLimit(1)

                Text(video.subtitle)
                    .font(.system(size: 7))
                    .foregroundColor(.gray)
                    .lineLimit(1)

                HStack(spacing: 0) {
                    HStack(spacing: 1) {
                        ForEach(0..<leafCount, id: \.self) { _ in
                            Image(systemName: "leaf.fill")
                                .foregroundColor(.yogaGold)
                                .font(.system(size: 6))
                        }
                    }
                    Spacer()
                    Label(video.duration, systemImage: "clock")
                        .font(.system(size: 7))
                        .foregroundColor(.gray)
                }
            }
            .padding(.horizontal, 5)
            .padding(.vertical, 4)
        }
        .frame(height: 87)
        .background(Color.white)
        .cornerRadius(8)
        .clipped()
    }
}

private struct MiniFlowCardEmpty: View {
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "heart")
                .foregroundColor(.gray.opacity(0.3))
                .font(.system(size: 16))
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 87)
        .background(Color.gray.opacity(0.06))
        .cornerRadius(8)
    }
}

#Preview {
    NavigationStack {
        YogaLibraryView()
    }
    .environment(FavoritesStore())
}
