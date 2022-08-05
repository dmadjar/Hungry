//
//  DataController.swift
//  HungryApp
//
//  Created by Daniel Madjar on 8/4/22.
//

import Foundation
import CoreData
import CloudKit

class DataController: ObservableObject {
    let container = NSPersistentCloudKitContainer(name: "DataObjects")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Date failed to load: \(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data Saved")
        } catch {
            print("Could not Save")
        }
    }
    
    func addCheckIn(scale: Int16, time: Date, type: String, context: NSManagedObjectContext) {
        let checkIn = HungerObject(context: context)
        checkIn.scale = scale
        checkIn.time = time
        checkIn.type = type
        
        save(context: context)
    }
}
