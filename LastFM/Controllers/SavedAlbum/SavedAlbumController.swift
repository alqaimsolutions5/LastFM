//
//  SavedAlbumController.swift
//  LastFM
//
//  Created by Apple on 27/04/2019.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

typealias SavedAlbumController = SavedAlbumsViewController
extension SavedAlbumController {
    func loadAlbumDetailsFromDB(){
        let albums = AlbumDataLoader().loadAllAlbumsFromDB()
        savedAlbums.removeAll()
        savedAlbums.insert(contentsOf: albums, at: 0)
    }
}


