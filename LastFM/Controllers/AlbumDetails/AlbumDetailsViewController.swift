//
//  AlbumDegtailsViewController.swift
//  LastFM
//
//  Created by Apple on 21/04/2019.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class AlbumDetailsViewController: BaseViewController {
    
    var albumName : String = ""
    var artistName : String = ""
    var albumDetails : AlbumDetails?
    
    @IBOutlet weak var albumDetailView: MatchInfoView!
    
   // MARK: - View Controller life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAlbumDetails()
    }
    
    //MARK: - UI Methods
    
    func addRightBarButton(){
        
        guard let albumDetails : AlbumDetails = self.albumDetails else {
            return
        }
        
        let saveOrDeleteBtn : UIBarButtonItem
        
        if let _ : AlbumDetailsEntity = AlbumDataLoader().loadAlbumDetailsFromDB(albumDetails: albumDetails){

            saveOrDeleteBtn = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(deleteAlbum))
        }else{
            saveOrDeleteBtn = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveAlbum))
        }
        self.navigationItem.rightBarButtonItem = saveOrDeleteBtn
    }
}
