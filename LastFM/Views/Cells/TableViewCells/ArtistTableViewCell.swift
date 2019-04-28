//
//  ArtistTableViewCell.swift
//  LastFM
//
//  Created by Apple on 19/04/2019.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import AlamofireImage

class ArtistTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewArtist: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelListenersCount: UILabel!
    @IBOutlet weak var labelArtist: UILabel!
    
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
    /// - Parameter artist: artist to be loaded
    func updateCellContent(artist : Artist)  {
        
        if let imageUrl = URL(string: artist.images[2].imageUrl){
            self.imageViewArtist.af_setImage(withURL: imageUrl)
        }
        self.labelName.text = artist.name
        self.labelListenersCount.text = artist.listeners
    }

}
