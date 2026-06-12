//
//  Course.swift
//  YogaNowStudio
//
//  Created by Kaaatkina on 05.06.26.
//

import Foundation

struct Course: Identifiable, Equatable {

    let id: UUID
    let title: String
    let day: String
    let time: String
    let room: String
    let participants: Int
    let imageName: String

    init(
        id: UUID = UUID(),
        title: String,
        day: String,
        time: String,
        room: String,
        participants: Int,
        imageName: String
    ) {
        self.id = id
        self.title = title
        self.day = day
        self.time = time
        self.room = room
        self.participants = participants
        self.imageName = imageName
    }
}
