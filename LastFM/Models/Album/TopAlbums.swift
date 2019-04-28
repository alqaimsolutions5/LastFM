//
//  TopAlbums.swift
//  LastFM
//
//  Created by Apple on 20/04/2019.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import ObjectMapper

class TopAlbums: NSObject, Mappable {
    
    var albums      : [Album] = Array()
    var attributes  : AlbumAttributes!
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        albums      <- map["album"]
        attributes  <- map["@attr"]
    }
    

}
