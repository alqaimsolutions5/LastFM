//
//  SearchArtistDataSource.swift
//  LastFM
//
//  Created by Apple on 28/04/2019.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

typealias SearchArtistDataSource = SearchArtistViewController

extension SearchArtistDataSource : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let artist = self.searchResults[indexPath.row]
        let cell : ArtistTableViewCell = tableView.dequeueReusableCell(withIdentifier: SearchArtistViewController.searchArtistIdentifier) as! ArtistTableViewCell
        cell.updateCellContent(artist: artist)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

