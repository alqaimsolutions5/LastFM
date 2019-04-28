//
//  Track.swift
//  LastFM
//
//  Created by Apple on 20/04/2019.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import ObjectMapper

class Track : NSObject, Mappable {
	var name : String = ""
	var url : String = ""
	var duration : String = ""
	var artist : Artist!

    required init?(map: Map) {

	}
    
    /// Init with Database TrackEntity
    ///
    /// - Parameter trackEntity: TrackEntity
    init(fromTrackEntity trackEntity : TrackEntity){
       
        self.name = trackEntity.name
        self.url = trackEntity.url
        self.duration = trackEntity.duration
        self.artist = Artist(withArtistEntity: trackEntity.artist)
    }

    func mapping(map: Map) {

		name <- map["name"]
		url <- map["url"]
		duration <- map["duration"]
		artist <- map["artist"]
	}

}
