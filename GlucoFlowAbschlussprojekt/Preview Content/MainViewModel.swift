//
//  MainViewModel.swift
//  GlucoFlowAbschlussprojekt
//
//  Created by Dennis Bischof on 02.08.24.
//

import Foundation

class MainViewModel: ObservableObject {
    
    @Published var setting = false
    
    func addButtonTapped() {
        setting = true
    }
}
