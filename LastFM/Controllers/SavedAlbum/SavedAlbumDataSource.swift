//
//  SavedAlbumDataSource.swift
//  LastFM
//
//  Created by Apple on 27/04/2019.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

typealias SavedAlbumDataSource = SavedAlbumsViewController
extension SavedAlbumDataSource: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return savedAlbums.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let albumDetails : AlbumDetails = self.savedAlbums[indexPath.row]
        let cell : SavedAlbumCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: SavedAlbumsViewController.savedAlbumsIdentifier, for: indexPath) as! SavedAlbumCollectionViewCell
        cell.populateView(fromAlbum: albumDetails)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
