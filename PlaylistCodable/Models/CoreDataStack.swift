//
//  CoreDataStack.swift
//  PlaylistCodable
//
//  Created by Soul Master on 11/13/19.
//  Copyright © 2019 Aaron Martinez. All rights reserved.
//

import Foundation
//import CoreData
import CoreData
// creating a classcalled CareData Stack.
enum CoreDataStack {
    //creatingand initializing the persistent container
    static let container: NSPersistentContainer = {
        //this line exactly is where we create our container, our initilizer "PlaylistCodable" has to match up with our data model
        let container = NSPersistentContainer(name: "PlaylistCodable")
        container.loadPersistentStores() { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    //creating a way "variable" for us that allows us to access the context throughout the application
    static var context: NSManagedObjectContext { return container.viewContext }
}
