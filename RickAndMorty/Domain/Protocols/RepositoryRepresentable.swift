//
//  RepositoryRepresentable.swift
//  RickAndMorty
//
//  Created by Gerald on 13/8/24.
//

import Foundation

protocol RepositoryRepresentable {}

protocol CharacterRepositoryRepresentable: AnyObject, RepositoryRepresentable {
    var _api: RickAndMortyAPIs { get set }
    
    func getCharacters(page: String) async -> Result<[Character], Failure>
    
    func getSingleCharacter(id: String) async -> Result<Character, Failure>
}
