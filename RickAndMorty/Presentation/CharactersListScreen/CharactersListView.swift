//
//  ContentView.swift
//  RickAndMorty
//
//  Created by Gerald on 23/7/24.
//

import SwiftUI

struct CharactersListView: View {
    @State private var charactersModel = CharactersListViewModel()
    
    
    var body: some View {
        NavigationStack{
            List(charactersModel.characters) { character in
                NavigationLink(destination: CharacterItem(character: character)){
                    CharacterItem(character: character)
                }
                
            }
            .navigationTitle("Characters")
            .task{
                try? await charactersModel.fetchCharacters()
            }
        }
        
    }
}

#Preview {
    CharactersListView()
}
