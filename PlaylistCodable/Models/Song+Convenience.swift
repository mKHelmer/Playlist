//
//  Song+Convenience.swift
//  PlaylistCodable
//
//  Created by Soul Master on 11/13/19.
//  Copyright © 2019 Aaron Martinez. All rights reserved.
//

import Foundation
import CoreData

//SONG IS A MANAGED OBJECT.
extension Song {
    //discardableresult allows us to forego the wildcarding when creating a new song.
    convenience init(name: String, artist: String, playlist: Playlist, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.name = name
        self.artist = artist
        //this is actually our relationship it is not an attribute. Here is where we are connecting the relationship when we pass in a playlist. 
        self.playlist = playlist
    }
}
