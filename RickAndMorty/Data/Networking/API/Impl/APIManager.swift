//
//  APIManager.swift
//  RickAndMorty
//
//  Created by Gerald on 23/7/24.
//

import Foundation
import SwiftUI
import UIKit

class APIManager{

    static let shared = APIManager()
    
    internal let session = URLSession.shared
    
    init() {}
    
}

extension APIManager: CharacterAPIRepresentable {
    
    func fetchCharacters(page: String) async -> Result<[Character], Failure> {
        
        do{
            let pageResult: Page = try await request(endpoint: Constatns.RICK_AND_MORTY_API.BASE_URL + "character?page=" + page, method: "GET")
            return .success(pageResult.results)
        }catch{
            if let faulure = error as? Failure{
                return .failure(faulure)
            } else {
                return .failure(.APIError(error))
            }
        }
    }
    
    func fetcSingleCharacter(id: String) async -> Result<Character, Failure> {
        do{
            let characterResult: Character = try await request(endpoint: Constatns.RICK_AND_MORTY_API.BASE_URL +  "character/" + id, method: "GET")
            return .success(characterResult)
        }catch{
            if let faulure = error as? Failure{
                return .failure(faulure)
            } else {
                return .failure(.APIError(error))
            }
        }
    }
    
    func request<T: Codable>(endpoint: String, method: String = "GET", parameters: [String: Any]? = nil) async throws -> T {
        
        guard let url = URL(string: endpoint) else {
            throw Failure.urlConstructError
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method
        
        // Set Content-Type header
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Handle query parameters if present
        if let parameters = parameters, !parameters.isEmpty, method == "GET" {
            var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
            components.queryItems = parameters.map { URLQueryItem(name: $0.key, value: "\($0.value)")}
            request.url = components.url
        }
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        //Validate response (you can add more validation as needed)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw Failure.repositoryError
        }
        
        do{
            let decodedResponse = try JSONDecoder().decode(T.self, from: data)
            return decodedResponse
        }catch {
            throw Failure.APIError(error)
        }
    }
}
