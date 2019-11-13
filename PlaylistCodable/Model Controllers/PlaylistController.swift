//
//  PlaylistController.swift
//  PlaylistCodable
//
//  Created by Aaron Martinez on 11/1/17.
//  Copyright © 2017 Aaron Martinez. All rights reserved.
//

import Foundation
import CoreData

class PlaylistController {
    
    static let shared = PlaylistController()
    
    init() {
        
    }
    
    func add(playlistWithName name: String) {
        //creating a new playlist usingthe name from the parameter, technically initializing it with our CoreDataStack.context, you don't see it happening here becuase we set a default value in our convenience initializer.
        _ = Playlist(name: name)
        //Making sure that our changes to the managed object context are saved to persist.
        saveToPersistentStore()
        
        
    }
    
    func delete(playlist: Playlist) {
        let moc = CoreDataStack.context
        //going to our Managed Object Context store and deleting the playlist.
        moc.delete(playlist)
        //ensuring that the playlist has been deleted from our pesistent store
        saveToPersistentStore()
    }
    
    // MARK: - Persistence
    
    func saveToPersistentStore() {
        let moc = CoreDataStack.context
        do{
            //trying to save what is in our MOC to the persistent stor
            try moc.save()
        } catch {
            //catching the error from the do try catch block and printing what the error is
            print("there was a problem saving to persistent store: \(error.localizedDescription)")
        }
        // MARK: - Properties (aka new source of truth)
        
    }
    //making our playlistarray a computed property, we need to return an array of playlist
    var playlists: [Playlist] {
        //creating our fetch request and specifying that it will be of type playlist
        let request: NSFetchRequest<Playlist> = Playlist.fetchRequest()
        //returning our array of playlists, nil coelescing to an empty array if the request did not work
        return (try? CoreDataStack.context.fetch(request)) ?? []
    }
}
