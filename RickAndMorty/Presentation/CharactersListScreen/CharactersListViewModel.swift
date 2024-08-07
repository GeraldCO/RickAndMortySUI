//
//  characterListViewModel.swift
//  RickAndMorty
//
//  Created by Gerald on 28/7/24.
//

import Foundation

@Observable
class CharactersListViewModel{
    var characters : [Character] = []
    
    func fetchCharacters() async throws {
        APIManager.shared.request(endpoint: "https://rickandmortyapi.com/api/character", method: "GET") { (result: Result<Page, Error>) in
            switch result {
            case .success(let page):
                self.characters = page.results
                print("Received pages: ", page.info.pages)
            case .failure(let requestError):
                (print("Request failed with error:", requestError))
            }
        }
    }
}
