//
//  ArtistMatches.swift
//  LastFM
//
//  Created by Apple on 19/04/2019.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import ObjectMapper

class ArtistMatches: NSObject, Mappable {
    
    var artists : [Artist] = Array()
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        artists <- map["artist"]
    }
    
    
}
