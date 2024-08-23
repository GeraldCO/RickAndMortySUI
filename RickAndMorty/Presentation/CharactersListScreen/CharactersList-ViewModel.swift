//
//  characterListViewModel.swift
//  RickAndMorty
//
//  Created by Gerald on 28/7/24.
//

import Foundation
import SwiftUI

protocol CharacterListScreenCoordinatorRepresentable{
    func navigateToDetailScreen(with id: String)
}


extension CharactersListView{
    final class ViewModel: ObservableObject{
        
        var coordinator: CharacterListScreenCoordinatorRepresentable?
        
        @Published var characters: [Character] = []
        @Published var error: Error? = nil
        
        private var currentPage = 0
        private let useCases: CharacterUseCases
            
        
        // MARK: Initializers.
        init(_ useCases: CharacterUseCases) {
            self.useCases = useCases
        }
        
        // MARK: Public Methods
        func collectionViewDidScrolldown(){
            loadNextPage()
        }
        

        
        // MARK: Private Methods
        private func loadNextPage() {
            currentPage += 1
            let page = String(currentPage)
            if page <= Constatns.RICK_AND_MORTY_API.LAST_PAGE_INDEX{
                
                Task {
                    let charactersList = await getCharacters(page: page)
                    let newCharactersList = self.characters + charactersList
                    DispatchQueue.main.async {
                        self.characters.append(contentsOf: newCharactersList)
                    }
                }
            }
        }
        
        private func getCharacters(page: String) async -> [Character] {
            let response = await self.useCases.getCharacters(page: page)
            
            switch response {
            case .success(let charactersList):
                return charactersList
            case .failure(let error):
                DispatchQueue.main.async {
                    self.error = error
                }
                return[]
            }
        }
        
    }



}
