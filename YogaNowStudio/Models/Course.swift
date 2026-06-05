//
//  Course.swift
//  YogaNowStudio
//
//  Created by Kaaatkina on 05.06.26.
//

import Foundation

struct Course: Identifiable {

    let id = UUID()
    let title: String
    let day: String
    let time: String
    let room: String
    let participants: Int
    let imageName: String
}
