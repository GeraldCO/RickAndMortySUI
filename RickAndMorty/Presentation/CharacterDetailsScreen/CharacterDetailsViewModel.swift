//
//  CharacterDetailsViewModel.swift
//  RickAndMorty
//
//  Created by Gerald on 1/8/24.
//

import Foundation

@Observable
class CharacterDetailsViewModel {
    var characterDidChange: ((Character) -> Void)?
    var errorDidChange: ((Error) -> Void)?
    
    private(set) var character: Character! = nil {
        didSet {
            characterDidChange?(character)
        }
    }
    
    private(set) var error: Error! = nil {
        didSet {
            errorDidChange?(error)
        }
    }
    
}
