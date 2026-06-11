//
//  FavoritesStore.swift
//  YogaNowStudio
//
//  Created by Kaaatkina on 04.06.26.
//
import Foundation
import Observation

private let storageKey = "favoriteIDs"

@Observable
class FavoritesStore {
    // ordered: newest last
    private(set) var orderedIDs: [UUID] = []

    var favoriteIDs: Set<UUID> { Set(orderedIDs) }

    init() {
        guard let data = UserDefaults.standard.data(forKey: storageKey),
              let ids = try? JSONDecoder().decode([UUID].self, from: data)
        else { return }
        orderedIDs = ids
    }

    func toggle(_ video: Video) {
        if let idx = orderedIDs.firstIndex(of: video.id) {
            orderedIDs.remove(at: idx)
        } else {
            orderedIDs.append(video.id)
        }
        persist()
    }

    func isFavorite(_ video: Video) -> Bool {
        favoriteIDs.contains(video.id)
    }

    func recentVideos(from all: [Video], count: Int = 4) -> [Video] {
        orderedIDs.suffix(count).reversed().compactMap { id in
            all.first { $0.id == id }
        }
    }

    private func persist() {
        if let data = try? JSONEncoder().encode(orderedIDs) {
            UserDefaults.standard.set(data, forKey: storageKey)
        }
    }
}
