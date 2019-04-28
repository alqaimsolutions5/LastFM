//
//  SavedAlbumCollectionViewCell.swift
//  LastFM
//
//  Created by Apple on 25/04/2019.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class SavedAlbumCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageViewAlbum: UIImageView!
    @IBOutlet weak var labelAlbumName: UILabel!
    @IBOutlet weak var labelArtistName: UILabel!
    
    
    func populateView (fromAlbum albumDetails : AlbumDetails){
        if let url :URL =  URL(string:albumDetails.images[2].imageUrl){
            self.imageViewAlbum.af_setImage(withURL: url)
        }
        self.labelAlbumName.text = albumDetails.name
        self.labelArtistName.text = albumDetails.artistName
    }
    
    
}
