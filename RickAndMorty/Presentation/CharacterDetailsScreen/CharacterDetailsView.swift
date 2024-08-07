//
//  CharacterDetailsView.swift
//  RickAndMorty
//
//  Created by Gerald on 1/8/24.
//

import SwiftUI

struct CharacterDetailsView: View {
    let character: Character
    
    init(character: Character) {
        self.character = character
    }
    
    
    var body: some View {
        
        VStack{
            AsyncImage(url: URL(string: character.image)){ image in
                image.image?.resizable()
            }
                .frame(width: 300, height: 300)
            HStack{
                Text(character.species)
                    .padding()
                Spacer()
                Text(character.status.rawValue)
                    .padding()
            }
            Text("Gender")
                .font(.title)
            Text(character.gender.rawValue)
            Text("From")
                .font(.title)
            Text(character.origin.name)
            Text("First seen in")
                .font(.title)
            Text(character.episode.first ?? "unknown")
        }
        Spacer()
    }
}

struct CharacterDetailsView_Previews: PreviewProvider{
    static var previews: some View{
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
        CharacterDetailsView(character: character)
    }
}
