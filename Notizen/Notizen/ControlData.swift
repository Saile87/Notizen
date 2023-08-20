//
//  ControlData.swift
//  Notizen
//
//  Created by Elias Breitenbach on 20.08.23.
//

import Foundation
import CoreData

class ControlData: ObservableObject {
    
    var container: NSPersistentContainer
    
    init(name: String) {
        container = NSPersistentContainer(name: name)
        container.loadPersistentStores { _, error in
            if let error = error {
                print("CoreData Error: \(error.localizedDescription)")
            }
        }
    }
}
