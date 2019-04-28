//
//  AlbumAttributes.swift
//  LastFM
//
//  Created by Apple on 20/04/2019.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import ObjectMapper

class AlbumAttributes: NSObject, Mappable {
    
    var artistName = ""
    var page = 0
    var perPage = 0
    var totalPages = 0
    var total = 0
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        artistName <- map["artistName"]
        
        var pageString : String = ""
        pageString <- map["page"]
        page = Int(pageString) ?? 0
        
        var perPageString : String = ""
        perPageString <- map["perPage"]
        perPage = Int(perPageString) ?? 0
        
        var totalPagesString : String = ""
        totalPagesString <- map["totalPages"]
        totalPages = Int(totalPagesString) ?? 0
        
        var totalString : String = ""
        totalString <- map["total"]
        total = Int(totalString) ?? 0
        
    }
    
    
    
    
}
