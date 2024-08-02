//
//  PersistentStore.swift
//  GlucoFlowAbschlussprojekt
//
//  Created by Dennis Bischof on 02.08.24.
//

import Foundation
import CoreData

class PersistentStore {
    
    static let shared = PersistentStore()
    
    var context: NSManagedObjectContext {
        return container.viewContext
    }
    
    private let container: NSPersistentContainer
    
    private init() {
        container = NSPersistentContainer(name: "PatientDatabase")
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError(error.localizedDescription)
            }
            print("Datenbank geladen")
        }
    }
    
    func save() throws {
        try context.save()
    }
}
