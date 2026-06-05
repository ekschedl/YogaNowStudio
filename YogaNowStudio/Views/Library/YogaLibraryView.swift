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

            VStack(spacing: 15) {
                Image("LogoYogaNow")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 280)

                Text("Yoga Library")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.yogaGreen)

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
                .padding(.top, 8)

                Spacer()
            }
            .padding(.horizontal)
            .padding(.top, 30)
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
        VStack(spacing: 8) {
            NavigationLink {
                destination
            } label: {
                VStack(spacing: 2) {
                    Text(topLabel)
                        .italic()
                        .font(.caption)
                        .foregroundColor(.yogaGreen)
                    Text(flowTitle)
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.yogaGreen)
                }
                .multilineTextAlignment(.center)
                .padding(.horizontal, 12)
                .padding(.vertical, 10)
                .frame(maxWidth: .infinity)
                .background(Color.white.opacity(0.92))
                .cornerRadius(12)
                .shadow(color: .black.opacity(0.05), radius: 3)
            }
            .buttonStyle(.borderless)

            if let video {
                NavigationLink {
                    VideoDetailView()
                } label: {
                    FlowGridCard(video: video)
                }
                .buttonStyle(.borderless)
            }
        }
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
        VStack(spacing: 8) {
            NavigationLink {
                FavoritenView()
            } label: {
                VStack(spacing: 2) {
                    Text("meine")
                        .italic()
                        .font(.caption)
                        .foregroundColor(.yogaGreen)
                    Text("Favoriten")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.yogaGreen)
                }
                .multilineTextAlignment(.center)
                .padding(.horizontal, 12)
                .padding(.vertical, 10)
                .frame(maxWidth: .infinity)
                .background(Color.white.opacity(0.92))
                .cornerRadius(12)
                .shadow(color: .black.opacity(0.05), radius: 3)
            }
            .buttonStyle(.borderless)

            LazyVGrid(columns: columns, spacing: 4) {
                ForEach(0..<4, id: \.self) { i in
                    if let video = slots[i] {
                        NavigationLink {
                            VideoDetailView()
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
            .cornerRadius(16)
            .shadow(color: .black.opacity(0.07), radius: 5)
        }
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
            Image(video.imageName)
                .resizable()
                .scaledToFill()
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
