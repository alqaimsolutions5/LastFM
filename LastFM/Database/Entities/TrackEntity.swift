//
//  TrackEntity.swift
//  LastFM
//
//  Created by Apple on 23/04/2019.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import RealmSwift

class TrackEntity: Object {
    
    @objc dynamic var name : String = ""
    @objc dynamic var url : String = ""
    @objc dynamic var duration : String = ""
    @objc dynamic var artist : ArtistEntity!
    
    convenience init(track: Track) {
        self.init()
        self.name = track.name
        self.url = track.url
        self.duration = track.duration
        self.artist = ArtistEntity(artist: track.artist!)
    }

}
