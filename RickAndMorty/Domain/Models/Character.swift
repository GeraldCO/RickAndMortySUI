//
//  Character.swift
//  RickAndMorty
//
//  Created by Gerald on 23/7/24.
//

import Foundation

struct Character: Codable, Identifiable {
    let id: Int
    let name: String
    let status: Status
    let species, type: String
    let gender: Gender
    let origin, location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}



enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}


struct Location: Codable {
    let name: String
    let url: String
}
