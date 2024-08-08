//
//  ReceiptResult.swift
//  GlucoFlowAbschlussprojekt
//
//  Created by Dennis Bischof on 08.08.24.
//

import Foundation

enum APIKeys {
    static let receiptAPIKey = "c4f10581062e48dd836c669eaaa252b9"
}

struct MealResult: Codable {
    let results: [CurrentReceipt]
    
}

struct CurrentReceipt: Codable {
    let id: Int
    let title: String
    let image: URL
    
}

struct RecipeError: Codable {
    let status: String
    let code: Int
    let message: String
}
