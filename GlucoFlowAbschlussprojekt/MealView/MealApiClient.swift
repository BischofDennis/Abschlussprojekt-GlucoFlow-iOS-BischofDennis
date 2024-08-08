//
//  ReceiptApiClient.swift
//  GlucoFlowAbschlussprojekt
//
//  Created by Dennis Bischof on 08.08.24.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case decodingError
    case backendError(String)
    case serverError
    case unknown
}


class MealAPIClient {
    
    
    /*func fetchReceipt() async throws -> [CurrentReceipt] {
        
        guard let url = URL(string: "https://api.spoonacular.com/recipes/complexSearch?apiKey=\(APIKeys.receiptAPIKey)") else {
            fatalError("invalid url")
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let result = try JSONDecoder().decode(MealResult.self, from: data)
        
        return result.results
    }
    */
    
    func searchRecipeWithError(searchQuery: String) async throws -> [CurrentReceipt] {
        guard let url = URL(string: "https://api.spoonacular.com/recipes/complexSearch?query=\(searchQuery)&apiKey=\(APIKeys.receiptAPIKey)") else {
            throw APIError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
            throw APIError.unknown
        }
        
        switch statusCode {
        case 200...299:
            do {
                return try JSONDecoder().decode(MealResult.self, from: data).results
            } catch {
                throw APIError.decodingError
            }
        case 400...499:
            let error = try JSONDecoder().decode(RecipeError.self, from: data)
            throw APIError.backendError(error.message)
        case 500:
            throw APIError.serverError
        default:
            throw APIError.unknown
        }
    }
}
