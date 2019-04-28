//
//  AlbumDetailsEntity.swift
//  LastFM
//
//  Created by Apple on 23/04/2019.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import RealmSwift

class AlbumDetailsEntity: Object {
    
    @objc dynamic var name       : String = ""
    @objc dynamic var artistName : String = ""
    @objc dynamic var mbid       : String = ""
    @objc dynamic var url        : String = ""
    var images                   : List = List<ImageEntity>()
    @objc dynamic var listeners  : String = ""
    @objc dynamic var playcount  : String = ""
    var tracks                   : List = List<TrackEntity>()
    
    convenience init(albumDetails: AlbumDetails) {
        
        self.init()
        
        self.name = albumDetails.name
        self.artistName = albumDetails.artistName
        self.mbid = albumDetails.mbid
        self.url = albumDetails.url
        
        for image in albumDetails.images {
            let imageEntity : ImageEntity = ImageEntity(image: image)
            self.images.append(imageEntity)
        }
        
        self.listeners = albumDetails.listeners
        self.playcount = albumDetails.playcount
        
        for track in albumDetails.tracks {
            let trackEntity : TrackEntity = TrackEntity(track: track)
            self.tracks.append(trackEntity)
        }
    }
    
}
