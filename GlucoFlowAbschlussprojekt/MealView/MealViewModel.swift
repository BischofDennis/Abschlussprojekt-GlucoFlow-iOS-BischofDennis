//
//  MealViewModel.swift
//  GlucoFlowAbschlussprojekt
//
//  Created by Dennis Bischof on 02.08.24.
//

import Foundation


class MealViewModel: ObservableObject {
    
    @Published var rezeptListe: [CurrentReceipt] = []
    @Published var errorText = ""
    @Published var showError = false
    
    private let repository = MealAPIClient()

    @MainActor
    func fetchData() {
        //asynchron
        Task {
            do {
                rezeptListe = try await repository.fetchReceipt()
                
            } catch {
                showError = true
                errorText = error.localizedDescription
                print(error.localizedDescription)
            }
        }
        
    }
}
