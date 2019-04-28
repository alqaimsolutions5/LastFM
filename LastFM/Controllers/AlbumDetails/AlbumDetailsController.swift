//
//  AlbumDetailsController.swift
//  LastFM
//
//  Created by Apple on 28/04/2019.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

typealias AlbumDetailsController = AlbumDetailsViewController
extension AlbumDetailsController {
    
    //MARK: - DB Methods
    
    @objc func saveAlbum(){
        
        if (self.albumDetails != nil){
            
            AlbumDataLoader().saveAlbumaDetailsToDB(albumDetails: self.albumDetails!, success: {
                self.showAlertWithTitle(title: Constants.success, andMsg: Constants.successSaveAlbum, andHandler: nil)
                self.addRightBarButton()
            }) { (error) in
                self.showAlertWithTitle(title: ErrorDescription.error, andMsg: error.localizedDescription, andHandler: nil)
            }
            
        }
    }
    
    @objc func deleteAlbum(){
        AlbumDataLoader().deleteAlbumDetails(albumDetails: self.albumDetails!, success: {
            self.showAlertWithTitle(title: Constants.success, andMsg: Constants.successDeleteAlbum, andHandler: nil)
            self.addRightBarButton()
        }) { (error) in
            self.showAlertWithTitle(title: ErrorDescription.error, andMsg: error.localizedDescription, andHandler: nil)
        }
    }
    
    //MARK: - API Methods
    
    func loadAlbumDetails (){
        
        showHUD(title:nil)
        
        let _ = AlbumLoader().loadAlbumDetails(albumName,artistName : artistName, completionHandle: { [weak self](albumDetails) in
            
            guard let weakSelf = self else { return }
            weakSelf.hideHUD()
            weakSelf.albumDetails = albumDetails
            weakSelf.albumDetailView.populateUI((self?.albumDetails!)!)
            weakSelf.addRightBarButton()
            
        }) { [weak self](error) in
            
            guard let weakSelf = self else { return }
            weakSelf.hideHUD()
            weakSelf.showAlertWithTitle(title: "", andMsg: "", andHandler: nil)
        }
    }
}

