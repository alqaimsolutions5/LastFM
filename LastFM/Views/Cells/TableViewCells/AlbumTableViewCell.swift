//
//  AlbumTableViewCell.swift
//  LastFM
//
//  Created by Apple on 20/04/2019.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewAlbum: UIImageView!
    @IBOutlet weak var labelAlbumName: UILabel!
    @IBOutlet weak var labelPlayCount: UILabel!
    @IBOutlet weak var labelAstistName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    /// Update the contents of the cell
    ///
    /// - Parameter album: album to be loaded
    func updateCellContent(album : Album, artist : Artist)  {
        
        if let imageUrl = URL(string: album.images[2].imageUrl){
            self.imageViewAlbum.af_setImage(withURL: imageUrl)
        }
        self.labelAlbumName.text = album.name
        self.labelPlayCount.text = "\(album.playcount)"
        self.labelAstistName.text = "\(artist.name)"
    }

}
