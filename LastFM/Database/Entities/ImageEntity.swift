//
//  ImageEntity.swift
//  LastFM
//
//  Created by Apple on 23/04/2019.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import RealmSwift

class ImageEntity: Object {
    
    @objc dynamic var imageUrl : String = ""
    @objc dynamic var size     : String = ""

    convenience init( image: Image) {
        
        self.init()
        self.imageUrl = image.imageUrl
        self.size = image.size
    }
}
