//
//  APIRepresentable.swift
//  RickAndMorty
//
//  Created by Gerald on 6/8/24.
//

import Foundation

protocol APIRepresentable {
    
    var session: URLSession { get }
}

protocol CharacterAPIRepresentable: AnyObject, APIRepresentable {
    
    func fetchCharacters(page: String) async-> Result<[Character], Failure>
    
    func fetcSingleCharacter(id: String) async-> Result<Character, Failure>
    
}
