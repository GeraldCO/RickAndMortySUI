//
//  RickAndMortyRepository.swift
//  RickAndMorty
//
//  Created by Gerald on 6/8/24.
//

import Foundation

enum RickAndMortyAPIs{
    case RickAndMortyApi
    
    var implementationClass: any APIRepresentable {
        switch self {
        case .RickAndMortyApi: return APIManager.shared
        }
    }
}

final class RickAndMortyRepository {
    internal var _api: RickAndMortyAPIs
    
    init(_api: RickAndMortyAPIs = .RickAndMortyApi) {
        self._api = _api
    }
}

extension RickAndMortyRepository: CharacterRepositoryRepresentable {
    var api: CharacterAPIRepresentable {
        _api.implementationClass as! CharacterAPIRepresentable
    }
    
    func getCharacters(page: String) async -> Result<[Character], Failure> {
        return await api.fetchCharacters(page: page)
    }
    
    func getSingleCharacter(id: String) async -> Result<Character, Failure> {
        return await api.fetcSingleCharacter(id: id)
    }
}
