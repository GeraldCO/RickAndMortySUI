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
    enum NetworkError: Error {
        case invalidURL
        case noDataReceived
        case underlyingError(Error)
    }
    static let shared = APIManager()
    
    private init() {}
    
    func request<T: Codable>(endpoint: String, method: String = "GET", parameters: [String: Any]? = nil, completion: @escaping (Result<T, Error>) -> Void) {
        
        guard let url = URL(string: endpoint) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method
        
        //Set Content-Type header
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        //handle query parameters if present
        if let parameters = parameters, !parameters.isEmpty, method == "GET" {
            var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
            components.queryItems = parameters.map { URLQueryItem(name: $0.key, value: "\($0.value)")}
            request.url = components.url
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, respongse, error in
            if let error = error{
                completion(.failure(NetworkError.underlyingError(error)))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.noDataReceived))
                return
            }
            
            do {
                let decodedResponse = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedResponse))
            }catch let jsonError {
                completion(.failure(NetworkError.underlyingError(jsonError)))
            }
        }
        task.resume()
    }
}
