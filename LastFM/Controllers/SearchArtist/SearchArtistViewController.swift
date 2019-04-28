//
//  SearchArtistViewController.swift
//  LastFM
//
//  Created by Apple on 18/04/2019.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class SearchArtistViewController: BaseViewController {
    
    static let searchArtistIdentifier = "searchArtistIdentifier"
    static let topAlbumsSegueIdentifier = "topAlbumsSegue"
    static let searchLength = 50

    @IBOutlet weak var searchbarArtist: UISearchBar!
    @IBOutlet weak var tableViewArtist: UITableView!
    
    var pageNumber = 1
    var totalResults = 0
    var isDataLoading = false
    var searchText = ""
    
    var searchResults : [Artist] = Array()
    
    // MARK: - View Controller life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == SearchArtistViewController.topAlbumsSegueIdentifier {
            
            guard let topAlbumViewController : TopAlbumsViewController = segue.destination as? TopAlbumsViewController else{
                return
            }
            guard let indexpath = self.tableViewArtist.indexPathForSelectedRow else{
                return
            }
            topAlbumViewController.selectedArtist = searchResults[indexpath.row]
        }
    }
}

//MARK: - UISearchBar Delegate
extension SearchArtistViewController : UISearchBarDelegate{
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        if (searchBar.text == nil || searchBar.text == ""){
            self.showAlertWithTitle(title: ErrorDescription.error, andMsg:ErrorDescription.searchIsEmpty , andHandler: nil)
        }else{
            if (searchBar.text != searchText){
              resetSearch()
            }
            searchText = searchBar.text!
            search()
        }
    }
}

//MARK: - ScrollView Delegate
extension SearchArtistViewController: UIScrollViewDelegate {
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        isDataLoading = false
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        if (tableViewArtist.contentOffset.y + tableViewArtist.frame.size.height) >= tableViewArtist.contentSize.height {
            
            if !isDataLoading && self.searchResults.count < totalResults {
                
                self.loadNextPage()
            }
        }
    }
}
