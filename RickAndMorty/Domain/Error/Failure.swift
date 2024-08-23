//
//  Failure.swift
//  RickAndMorty
//
//  Created by Gerald on 6/8/24.
//

import Foundation

enum Failure: Error {
    case decodingError
    case urlConstructError
    case APIError(Error)
    case repositoryError
    
    var title: String {
        "Server not available at the moment"
    }
    
    var localizedDescription: String {
        "We are working to fix this issue, thanks for understanding"
    }
}
