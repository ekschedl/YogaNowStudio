//
//  Asana.swift
//  YogaNowStudio
//
import Foundation

struct Asana: Identifiable {
    let id: UUID
    let name: String
    var shortName: String? = nil
    let sanskrit: String
    let description: String
    let steps: [String]
    let benefits: [String]
    let imageName: String
}
