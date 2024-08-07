//
//  Page.swift
//  RickAndMorty
//
//  Created by Gerald on 23/7/24.
//

import Foundation

// MARK: - Welcome
struct Page: Codable {
    let info: Info
    let results: [Character]
}

// MARK: - Info
struct Info: Codable {
    let count, pages: Int
    let next, prev: String?
}

