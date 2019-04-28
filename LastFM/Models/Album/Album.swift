//
//  Album.swift
//  LastFM
//
//  Created by Apple on 20/04/2019.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import ObjectMapper

class Album: NSObject, Mappable {
    
    var name        : String    = ""
    var playcount   : Int       = 0
    var images      : [Image]   = Array()
    var mbid        : String    = ""
    var url         : String    = ""
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        
        name        <- map["name"]
        playcount   <- map["playcount"]
        images      <- map["image"]
        mbid        <- map["mbid"]
        url         <- map["url"]
    }

}
