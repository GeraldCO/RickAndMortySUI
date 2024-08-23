//
//  CharacterUseCases.swift
//  RickAndMorty
//
//  Created by Gerald on 5/8/24.
//

import Foundation

final class CharacterUseCases{
    
    /*
     Here u can change the data origin
     */
    private let api: RickAndMortyAPIs
    
    lazy var repository: RickAndMortyRepository = { RickAndMortyRepository(_api: self.api) }()
    
    init(api: RickAndMortyAPIs) {
        self.api = api
    }
    
    func getCharacters(page: String) async -> Result<[Character], Failure> {
        return await repository.getCharacters(page: page)
    }
    
    func getSingleCharacter(id: String) async -> Result<Character, Failure> {
        return await repository.getSingleCharacter(id: id)
    }
    
}
