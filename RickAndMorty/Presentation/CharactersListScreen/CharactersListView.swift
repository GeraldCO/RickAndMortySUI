//
//  ContentView.swift
//  RickAndMorty
//
//  Created by Gerald on 23/7/24.
//

import SwiftUI

struct CharactersListView: View {
    @StateObject private var viewModel = ViewModel( CharacterUseCases(api: RickAndMortyAPIs.RickAndMortyApi))
    
    
    var body: some View {
        NavigationStack{
            List(viewModel.characters) { character in
                NavigationLink(destination: CharacterItem(character: character)){
                    CharacterItem(character: character)
                }
                
            }
            .navigationTitle("Characters")
            .task{
                 viewModel.collectionViewDidScrolldown()
            }
        }
        
    }
}

#Preview {
    CharactersListView()
}
