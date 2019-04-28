//
//  AlbumDataLoader.swift
//  LastFM
//
//  Created by Apple on 28/04/2019.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import RealmSwift

class AlbumDataLoader: NSObject {
    
    func loadAllAlbumsFromDB()->[AlbumDetails]{
        
        var albums : [AlbumDetails] = Array()
        let realm = try! Realm()
        let objects = realm.objects(AlbumDetailsEntity.self)
        
        for object in objects {
            let albumDetails : AlbumDetails = AlbumDetails(fromAlbumDetailsEntity: object)
            albums.append(albumDetails)
        }
        return albums
    }
    
    func loadAlbumDetailsFromDB(albumDetails : AlbumDetails) -> AlbumDetailsEntity?{
        
        let realm = try! Realm()
        
        guard let albumDetailsEntity : AlbumDetailsEntity = realm.objects(AlbumDetailsEntity.self).filter("name=%@ AND artistName=%@" ,albumDetails.name, albumDetails.artistName).first else{
            return nil
        }
        
        return albumDetailsEntity
    }
    
    func deleteAlbumDetails( albumDetails : AlbumDetails,success: @escaping ()->Void, failure : @escaping (_ error : Error)->Void){
        
        guard let albumDetailsEntity : AlbumDetailsEntity = self.loadAlbumDetailsFromDB(albumDetails: albumDetails) else {
            return
        }
        
        let realm = try! Realm()
        do {
            try realm.write {
                realm.delete(albumDetailsEntity)
                success()
            }
        } catch {
            let error = CustomError(title: "", description: error.localizedDescription, code: 0)
            failure(error)
        }
    }
    
    
    func saveAlbumaDetailsToDB( albumDetails : AlbumDetails,success: @escaping ()->Void, failure : @escaping (_ error : Error)->Void){
        
        let albumDetailsEntity : AlbumDetailsEntity = AlbumDetailsEntity(albumDetails: albumDetails)
        let realm = try! Realm()
        
        do {
            try realm.write {
                realm.add(albumDetailsEntity)
                success()
            }
        } catch {
            let error = CustomError(title: "", description: error.localizedDescription, code: 0)
            failure(error)
            
        }
    }

}
