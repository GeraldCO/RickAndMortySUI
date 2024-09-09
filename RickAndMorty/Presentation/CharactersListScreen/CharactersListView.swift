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
            List(viewModel.characters, id: \.id) { character in
                NavigationLink(destination: CharacterItem(character: character)){
                    CharacterItem(character: character)
                }
                .onAppear{
                    if(viewModel.characters.last?.id == character.id){
                        viewModel.collectionViewDidScrolldown()
                    }
                }
            }
            .navigationTitle("Characters")
            .task{
                if !viewModel.isFinished{
                    viewModel.collectionViewDidScrolldown()
                }
            }
        }
        
    }
}

#Preview {
    CharactersListView()
}
