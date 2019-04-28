//
//  TopAlbumsDataSource.swift
//  LastFM
//
//  Created by Apple on 28/04/2019.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

typealias TopAlbumsDataSource = TopAlbumsViewController

extension TopAlbumsDataSource : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.loadedAlbums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let album = self.loadedAlbums[indexPath.row]
        let cell : AlbumTableViewCell = tableView.dequeueReusableCell(withIdentifier: TopAlbumsViewController.searchArtistIdentifier) as! AlbumTableViewCell
        cell.updateCellContent(album: album, artist: self.selectedArtist)
        tableView.deselectRow(at: indexPath, animated: true)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
