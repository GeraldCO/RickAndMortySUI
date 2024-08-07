//
//  SwiftUIView.swift
//  RickAndMorty
//
//  Created by Gerald on 30/7/24.
//

import SwiftUI

struct CharacterItem: View {
    let character: Character
    
    init(character: Character){
        self.character = character
    }

    
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: character.image)){ image in
                image.image?.resizable()
            }
                .frame(width: 140, height: 140)
                
            VStack{
                Spacer()
                VStack{
                    Text(character.name)
                        .font(.headline)
                    Text(character.status.rawValue)
                        .font(.subheadline)
                }
                VStack{
                    Text("Last known location")
                        .font(.headline)
                    Text(character.location.name)
                }
                
                VStack{
                    Text("Origin")
                        .font(.headline)
                    Text(character.origin.name)
                }
            }
        }.frame(height: 160)
    }
}

struct CharacterItem_Previews: PreviewProvider{
    static var previews: some View {
        let character = Character(
            id: 1,
            name: "Rick Sanchez",
            status: .alive,
            species: "Human",
            type: "",
            gender: Gender(rawValue: "Male")! ,
            origin: Location(name: "Earth (C-137)", url: "https://rickandmortyapi.com/api/location/1"),
            location: Location(name: "Citadel of Ricks", url: "https://rickandmortyapi.com/api/location/3"),
            image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
            episode: ["https://rickandmortyapi.com/api/episode/1"],
            url: "https://rickandmortyapi.com/api/character/1",
            created: "2017-11-04T18:48:46.250Z"
        )
        
        CharacterItem(character: character)
    }
}
