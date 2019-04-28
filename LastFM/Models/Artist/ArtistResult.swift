//
//  ArtistResult.swift
//  LastFM
//
//  Created by Apple on 19/04/2019.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import ObjectMapper

class ArtistResult: NSObject, Mappable {
    
    var artistMatch : ArtistMatches!
    var totalResults : Int = 0
    required init?(map: Map) {

    }
    
    func mapping(map: Map) {
        
        artistMatch <- map["artistmatches"]
        
        var resultString : String = ""
        resultString <- map["opensearch:totalResults"]
        totalResults = Int(resultString) ?? 0
    }
    

}
