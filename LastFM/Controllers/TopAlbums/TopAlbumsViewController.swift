//
//  TopAlbumsViewController.swift
//  LastFM
//
//  Created by Apple on 20/04/2019.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class TopAlbumsViewController: BaseViewController {

    @IBOutlet weak var tableViewAlbums: UITableView!
    
    var loadedAlbums : [Album] = Array()
    var selectedArtist : Artist!
    
    var totalResults = 0
    var pageNumber = 1
    var isDataLoading = false
    
    static let searchArtistIdentifier = "albumIdentifier"
    static let albumDetailsSegue = "albumDetailsSegue"
    static let pageLength = 50
    
    // MARK: - View Controller life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAlbums()
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == TopAlbumsViewController.albumDetailsSegue{
            
            guard let albumDetailsViewController : AlbumDetailsViewController = segue.destination as? AlbumDetailsViewController else{
                return
            }
            guard let indexpath = self.tableViewAlbums.indexPathForSelectedRow else{
                return
            }
            let selectedAlbum : Album = self.loadedAlbums[indexpath.row]
            albumDetailsViewController.albumName = selectedAlbum.name
            albumDetailsViewController.artistName = self.selectedArtist.name
        }
    }
}

//MARK: - ScrollView Delegate
extension TopAlbumsViewController: UIScrollViewDelegate {
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        isDataLoading = false
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        if (tableViewAlbums.contentOffset.y + tableViewAlbums.frame.size.height) >= tableViewAlbums.contentSize.height {
            
            if !isDataLoading && self.loadedAlbums.count < totalResults {
                
                self.loadNextPage()
            }
        }
    }
}

