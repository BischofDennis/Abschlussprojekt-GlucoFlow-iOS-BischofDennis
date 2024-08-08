//
//  ReceiptApiClient.swift
//  GlucoFlowAbschlussprojekt
//
//  Created by Dennis Bischof on 08.08.24.
//

import Foundation


class MealAPIClient {
    
    
    func fetchReceipt() async throws -> [CurrentReceipt] {
        
        guard let url = URL(string: "https://api.spoonacular.com/recipes/complexSearch?apiKey=\(APIKeys.receiptAPIKey)") else {
            fatalError("invalid url")
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let result = try JSONDecoder().decode(MealResult.self, from: data)

        return result.results
    }
}
