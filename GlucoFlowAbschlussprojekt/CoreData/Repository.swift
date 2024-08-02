//
//  Repository.swift
//  GlucoFlowAbschlussprojekt
//
//  Created by Dennis Bischof on 02.08.24.
//

import Foundation
import CoreData

class Repository {
    
    static let shared = Repository()
    //private let store = PersistentStore()
    private let store = PersistentStore.shared
    
    private init() {}
    
    
    
    
}
