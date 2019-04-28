//
//  MatchInfoView.swift
//  LastFM
//
//  Created by Pedro Monteverde on 09/03/2019.
//  Copyright © 2019 Pedro Monteverde. All rights reserved.
//

import UIKit
import AlamofireImage
/// Designable View used for populating info about an Artist / Album / Track
@IBDesignable class MatchInfoView: UIView {
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var listenersLabel: UILabel!
    @IBOutlet weak var playsLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    private var view: UIView!
    
    
    func populateUI(_ albumDetail : AlbumDetails){
        
        DispatchQueue.main.async {
            self.nameLabel.text = albumDetail.name
            self.typeLabel.text = albumDetail.artistName
            self.listenersLabel.text = "Listeners: "+albumDetail.listeners
            self.playsLabel.text = "Play count: " + albumDetail.playcount
            if let imageUrl = URL(string: albumDetail.images[2].imageUrl){
                self.imageView.af_setImage(withURL: imageUrl)
            }

            self.summaryLabel.text = albumDetail.getTracksString()
            
        }
    }
    
    // MARK: - Designable
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    /// Setup view from .xib to also be displayed in the storyboard
    func setup() {
        view = loadViewFromNib()
        view.frame = bounds
        insertSubview(view, at: 0)
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: MatchInfoView.self)
        let view = bundle.loadNibNamed(String(describing: MatchInfoView.self), owner: self, options: nil)?.first as! UIView
        return view
    }
    
    
}
