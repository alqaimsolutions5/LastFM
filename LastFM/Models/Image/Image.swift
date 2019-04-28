//
//  Image.swift
//  LastFM
//
//  Created by Apple on 19/04/2019.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import ObjectMapper

class Image: NSObject, Mappable {
    
    var imageUrl : String = ""
    var size     : String = ""
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        imageUrl <- map["#text"]
        size     <- map["size"]
    }
    
    /// Init object from ImageEntity
    ///
    /// - Parameter imageEntity: imageEntity
    init(withImageEntity imageEntity : ImageEntity) {
        
        super.init()
        self.imageUrl = imageEntity.imageUrl
        self.size = imageEntity.size
        
    }
    
    
}
