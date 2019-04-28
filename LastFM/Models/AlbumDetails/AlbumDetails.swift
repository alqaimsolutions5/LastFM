//
//  AlbumDetails.swift
//  LastFM
//
//  Created by Apple on 20/04/2019.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import ObjectMapper

class AlbumDetails : NSObject, Mappable {
	var name : String = ""
	var artistName : String = ""
	var mbid : String = ""
	var url : String = ""
	var images : [Image] = Array()
	var listeners : String = ""
	var playcount : String = ""
	var tracks : [Track] = Array()

	required init?(map: Map) {

	}
    
    /// init from Daatabse AlbumDetailsEntity
    ///
    /// - Parameter albumDetailsEntity: AlbumDetailsEntity
    init(fromAlbumDetailsEntity albumDetailsEntity : AlbumDetailsEntity) {
        
        super.init()
        self.name = albumDetailsEntity.name
        self.artistName = albumDetailsEntity.artistName
        self.mbid = albumDetailsEntity.mbid
        self.url = albumDetailsEntity.url
        
        for imageEntity in albumDetailsEntity.images {
            let image = Image(withImageEntity: imageEntity)
            self.images.append(image)
        }
        
        self.listeners = albumDetailsEntity.listeners
        self.playcount = albumDetailsEntity.playcount
        
        for trackEntity in albumDetailsEntity.tracks {
            let track = Track(fromTrackEntity: trackEntity)
            self.tracks.append(track)
        }
    }

	func mapping(map: Map) {

		name <- map["name"]
		artistName <- map["artist"]
		mbid <- map["mbid"]
		url <- map["url"]
		images <- map["image"]
		listeners <- map["listeners"]
		playcount <- map["playcount"]
		tracks <- map["tracks.track"]
	}
    
    /// creates a list of all the track name
    ///
    /// - Returns: string containing the list of all the names
    func getTracksString()->String{
        var trackString = "Tracks:"
        for track : Track in self.tracks {
            trackString = trackString + "\n" + track.name
        }
        return trackString
    }
}
