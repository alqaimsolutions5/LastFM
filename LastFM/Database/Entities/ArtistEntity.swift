//
//  ArtistEntity.swift
//  LastFM
//
//  Created by Apple on 23/04/2019.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import RealmSwift

class ArtistEntity: Object {

    @objc dynamic var name        : String    = ""
    @objc dynamic var listeners   : String    = ""
    var images                    : List = List<ImageEntity>()
    @objc dynamic var mbi         : String    = ""
    @objc dynamic var url         : String    = ""
    @objc dynamic var streamable  : String    = ""
    
    convenience init( artist : Artist) {
        self.init()
        self.name = artist.name
        self.listeners = artist.listeners
        
        for image in artist.images {
            
            let imageEntity : ImageEntity = ImageEntity(image: image)
            self.images.append(imageEntity)
        }
        
        
        self.mbi = artist.mbi
        self.url = artist.url
        self.streamable = artist.streamable
    }
}
