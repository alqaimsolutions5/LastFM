//
//  TopAlbumsController.swift
//  LastFM
//
//  Created by Apple on 28/04/2019.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

typealias TopAlbumsController = TopAlbumsViewController

extension TopAlbumsController {
    
    /// Loads albums of the selected artist
    func loadAlbums(){
        
        self.showHUD(title: nil)
        let _ = AlbumLoader().loadTopAlbums(fromArtist: self.selectedArtist.name, withLimit: TopAlbumsViewController.pageLength, page: pageNumber, completionHandle: { [weak self](result) in
            
            guard let weakSelf = self else { return }
            weakSelf.totalResults = result.attributes.total
            weakSelf.pageNumber  = weakSelf.pageNumber+1
            weakSelf.loadedAlbums.append(contentsOf: result.albums)
            
            DispatchQueue.main.async {
                weakSelf.hideHUD()
                weakSelf.tableViewAlbums.reloadData()
            }
            
        }) { [weak self](error) in
            guard let weakSelf = self else { return }
            weakSelf.hideHUD()
            weakSelf.showAlertWithTitle(title: "", andMsg: "", andHandler: nil)
        }
    }
    
    /// Loads the next page of search results
    func loadNextPage(){
        
        isDataLoading = true
        loadAlbums()
        let x = tableViewAlbums.contentOffset.x
        let y = tableViewAlbums.contentSize.height - tableViewAlbums.frame.size.height
        tableViewAlbums.contentOffset = CGPoint(x: x, y: y)
    }
}

