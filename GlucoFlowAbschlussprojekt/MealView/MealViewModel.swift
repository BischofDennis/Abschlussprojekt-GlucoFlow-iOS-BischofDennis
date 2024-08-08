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

   /* @MainActor
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
        
    }*/
    
    func fetchRecipe(searchString: String) {
        Task {
            do {
                rezeptListe = try await repository.searchRecipeWithError(searchQuery: searchString)
            } catch let error as APIError {
                switch error {
                case .invalidURL:
                    errorText = "Invalid URL"
                case .decodingError:
                    errorText = "Decoding Error"
                case .unknown:
                    errorText = "Unknown Error"
                case .serverError:
                    errorText = "Server Error"
                case .backendError(let message):
                    errorText = message
                }
                showError = true
            } catch {
                errorText = error.localizedDescription
                showError = true
            }
        }
    }
}
