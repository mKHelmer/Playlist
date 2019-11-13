//
//  Playlist+Convenience.swift
//  PlaylistCodable
//
//  Created by Soul Master on 11/13/19.
//  Copyright © 2019 Aaron Martinez. All rights reserved.
//

import Foundation
import CoreData

//importing core data and extending playlist to allow us to create a convenience initializer.
//Playlit is a NSManagedObject
extension Playlist {
    //creating a convenience initializer allows us to conviently manage the NSManaged Objects
    convenience init(name: String, context: NSManagedObjectContext = CoreDataStack.context) {
        //initialized the context (THIS IS REQwuired)
        self.init(context: context)
        self.name = name
    }
}
