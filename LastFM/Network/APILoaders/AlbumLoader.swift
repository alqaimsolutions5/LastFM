//
//  AlbumLoader.swift
//  LastFM
//
//  Created by Apple on 25/04/2019.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class AlbumLoader: NSObject {
    
    /// Fetch top albums of artist from server
    ///
    /// - Parameters:
    ///   - artistName: artist name
    ///   - limit: limit per page
    ///   - page: page number
    ///   - completionHandle: completion block
    ///   - faliureHandler: failure block
    func loadTopAlbums(fromArtist artistName : String, withLimit limit : Int, page : Int,  completionHandle: @escaping (_ response: TopAlbums)->Void , faliureHandler:@escaping (_ error:Error) ->Void){
        
        let parameters = [APIParameter.method   : ApiMethods.getTopAlbums,
                          APIParameter.limit    : "\(limit)",
            APIParameter.page     : "\(page)",
            APIParameter.artist   : artistName,
            APIParameter.apiKey   : APIAccountCredentials.apiKey,
            APIParameter.format   : APIParameter.json]
        
        ServiceManager.sharedManager.callApi(url:Endpoints.baseURL , method: .post, params: parameters, completionHandle: { (response) in
            
            guard let responseDict = response as? [String:Any] else{
                let error = CustomError(title: "", description: ErrorDescription.somethingWrong, code: 0)
                faliureHandler(error)
                return
                
            }
            
            guard let result : TopAlbums = Mapper<TopAlbums>().map(JSONObject: responseDict["topalbums"]) else {
                let error = CustomError(title: "", description: ErrorDescription.somethingWrong, code: 0)
                faliureHandler(error)
                return
            }
            
            completionHandle(result)
            
        }) { (error) in
            
            faliureHandler(error)
            
        }
    }
    
    /// Fetch details of album from server
    ///
    /// - Parameters:
    ///   - albumName: name of the album
    ///   - artistName: name of the artist
    ///   - completionHandle: completion block
    ///   - faliureHandler: failure block
    
    func loadAlbumDetails(_ albumName : String, artistName : String, completionHandle: @escaping (_ response: AlbumDetails)->Void , faliureHandler:@escaping (_ error:Error) ->Void) ->Void {
        
        let parameters = [
            APIParameter.method        : ApiMethods.getAlbumDetail,
            APIParameter.apiKey        : APIAccountCredentials.apiKey,
            APIParameter.format        : APIParameter.json,
            APIParameter.album         : albumName,
            APIParameter.artist        : artistName
        ]
        
        ServiceManager.sharedManager.callApi(url: Endpoints.baseURL, method: .get, params: parameters, completionHandle: { (response) in
            
            guard let responseDict = response as? [String:Any] else{
                let error = CustomError(title: "", description: ErrorDescription.somethingWrong, code: 0)
                faliureHandler(error)
                return
                
            }
            
            if let _ = responseDict["error"] {
                if let errorMessage = responseDict["message"] as? String{
                    let error = CustomError(title: "", description: errorMessage, code: 0)
                    faliureHandler(error)
                    return
                }
            }
            
            guard let albumDetails : AlbumDetails = Mapper<AlbumDetails>().map(JSONObject: responseDict["album"]) else{
                let error = CustomError(title: "", description: ErrorDescription.somethingWrong, code: 0)
                faliureHandler(error)
                return
            }
            
            completionHandle(albumDetails)
            
        }) { (error) in
            faliureHandler(error)
        }
    }
}
