//
//  SongController.swift
//  PlaylistCodable
//
//  Created by Aaron Martinez on 11/1/17.
//  Copyright © 2017 Aaron Martinez. All rights reserved.
//

import Foundation

class SongController {
    
    static func create(songWithName name: String, artist: String, playlist: Playlist) {
        //creating a song and it is by default being added to our MOC
       _ = Song(name: name, artist: artist, playlist: playlist)
           //ensures that any changes that have been made are saved to Managed Object Context  and to persistent store
        PlaylistController.shared.saveToPersistentStore()
    }
    static func delete(song: Song) {
        let moc = CoreDataStack.context
        //deleting the song from our managed object context
        moc.delete(song)
         //ensures that any changes that have been made are saved to Managed Object Context  and to persistent store
        PlaylistController.shared.saveToPersistentStore()
    }
}
