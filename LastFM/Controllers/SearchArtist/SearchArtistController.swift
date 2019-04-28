//
//  SearchArtistController.swift
//  LastFM
//
//  Created by Apple on 28/04/2019.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

typealias SearchArtistController = SearchArtistViewController
extension SearchArtistController {
    
    /// Search Artists
    func search(){
        
        self.view.endEditing(true)
        self.showHUD(title: nil)
        
        let _ = ArtistLoader().searchArtist(withLimit: SearchArtistViewController.searchLength, page: self.pageNumber, searchValue: searchText, completionHandle: { [weak self](searchResult) in
            
            guard let weakSelf = self else { return }
            weakSelf.totalResults = searchResult.totalResults
            weakSelf.searchResults.append(contentsOf: searchResult.artistMatch.artists)
            
            DispatchQueue.main.async {
                weakSelf.tableViewArtist.reloadData()
                weakSelf.hideHUD()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    if (weakSelf.pageNumber == 2){ // if search query change, scroll to top results
                        weakSelf.scrollltoTop()
                    }
                }
                weakSelf.pageNumber += 1
            }
        }) { [weak self](error) in
            guard let weakSelf = self else { return }
            weakSelf.hideHUD()
            weakSelf.showAlertWithTitle(title: ErrorDescription.error, andMsg: error.localizedDescription, andHandler: nil)
        }
    }
    
    func scrollltoTop(){
        let topIndex = IndexPath(row: 0, section: 0)
        if (self.searchResults.count > 0){
            self.tableViewArtist.scrollToRow(at: topIndex, at: .top, animated: true)
        }
    }
    
    /// reset all the loaded data for the search
    func resetSearch(){
        pageNumber = 1
        totalResults = 0
        searchResults.removeAll()
        searchText = ""
    }
    
    /// Loads the next page of search results
    func loadNextPage(){
        
        isDataLoading = true
        search()
        let x = tableViewArtist.contentOffset.x
        let y = tableViewArtist.contentSize.height - tableViewArtist.frame.size.height
        tableViewArtist.contentOffset = CGPoint(x: x, y: y)
    }
}

