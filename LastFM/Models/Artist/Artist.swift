//
//  Artist.swift
//  LastFM
//
//  Created by Apple on 19/04/2019.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import ObjectMapper

class Artist: NSObject, Mappable {
    
    var name        : String    = ""
    var listeners   : String    = ""
    var images      : [Image]   = Array()
    var mbi         : String    = ""
    var url         : String    = ""
    var streamable  : String    = ""
    
    required init?(map: Map) {}
    
    
    func mapping(map: Map) {
        
        name        <- map["name"]
        listeners   <- map["listeners"]
        images      <- map["image"]
        mbi         <- map["mbi"]
        url         <- map["url"]
        streamable  <- map["streamable"]
    }
    
    
    /// Init from database ArtistEntity
    ///
    /// - Parameter artistEntity: ArtistEntity
    init(withArtistEntity artistEntity : ArtistEntity){
        
        self.name = artistEntity.name
        self.listeners = artistEntity.listeners
        
        for imageEntity in artistEntity.images {
            let image = Image(withImageEntity: imageEntity)
            self.images.append(image)
        }
        
        self.mbi = artistEntity.mbi
        self.url = artistEntity.url
        self.streamable = artistEntity.streamable
    }
    
}
