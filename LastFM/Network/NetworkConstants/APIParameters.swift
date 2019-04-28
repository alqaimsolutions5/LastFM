//
//  APIParameters.swift
//  LastFM
//
//  Created by Apple on 19/04/2019.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

enum APIParameter{
    static let method            = "method"
    static let limit             = "limit"
    static let page              = "page"
    static let apiKey            = "api_key"
    static let apiSig            = "api_sig"
    static let mbid              =  "mbid"
    static let format            = "format"
    static let json              = "json"
    static let username          = "username"
    static let password          = "password"
    static let album             = "album"
    static let artist            =  "artist"
    
}

enum ApiMethods{
    static let searchArtist      = "artist.search"
    static let getTopAlbums      = "artist.gettopalbums"
    static let getAlbumDetail    = "album.getinfo"
}

enum APIAccountCredentials{
    static let apiKey       = "b5db7828e8d6595d1c5317c9f952e66d"
    static let sharedSecret = "88a9762c28823b1f454f929881e55784"
}

