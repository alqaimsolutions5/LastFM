//
//  ViewController.swift
//  LastFM
//
//  Created by Apple on 18/04/2019.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class SavedAlbumsViewController: UIViewController {
    
    var savedAlbums : [AlbumDetails] = Array() {
        didSet {
            self.collectionViewAlbums.reloadData()
        }
    }
    @IBOutlet weak var collectionViewAlbums: UICollectionView!
    
    
    private static let albumDetailsSegue     = "albumDetailsSegue"
    static let savedAlbumsIdentifier = "savedAlbumsIdentifier"

    
    // MARK: - View Controller life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadAlbumDetailsFromDB()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == SavedAlbumsViewController.albumDetailsSegue {
            guard let albumDetailsViewController : AlbumDetailsViewController = segue.destination as? AlbumDetailsViewController else { return }
            guard let indexpath = self.collectionViewAlbums.indexPathsForSelectedItems?.first else { return }
            let selectedAlbum : AlbumDetails = self.savedAlbums[indexpath.row]
            albumDetailsViewController.albumName = selectedAlbum.name
            albumDetailsViewController.artistName = selectedAlbum.artistName
        }
    }
}




