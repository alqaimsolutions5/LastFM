//
//  ArtistLoader.swift
//  LastFM
//
//  Created by Apple on 25/04/2019.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper


class ArtistLoader: NSObject {
    
    /// Search artist from LastFM API
    ///
    /// - Parameters:
    ///   - limit: limit per page
    ///   - page: page number
    ///   - searchValue: artist to be searched
    ///   - completionHandle: success clousre
    ///   - faliureHandler: failure clousre
    
    func searchArtist(withLimit limit : Int, page : Int, searchValue : String, completionHandle: @escaping (_ response: ArtistResult)->Void , faliureHandler:@escaping (_ error:Error) ->Void){
        
        let parameters = [APIParameter.method: ApiMethods.searchArtist,
                          APIParameter.limit: "\(limit)",
            APIParameter.page: "\(page)",
            APIParameter.artist: searchValue,
            APIParameter.apiKey: APIAccountCredentials.apiKey,
            APIParameter.format: APIParameter.json]
        
        ServiceManager.sharedManager.callApi(url:Endpoints.baseURL , method: .post, params: parameters, completionHandle: { (response) in
            
            guard let responseDict = response as? [String:Any] else{
                let error = CustomError(title: "", description: ErrorDescription.somethingWrong, code: 0)
                faliureHandler(error)
                return
            }
            
            guard let result : ArtistResult = Mapper<ArtistResult>().map(JSONObject: responseDict["results"]) else {
                let error = CustomError(title: "", description: ErrorDescription.somethingWrong, code: 0)
                faliureHandler(error)
                return
            }
            
            completionHandle(result)
            
        }) { (error) in
            
            faliureHandler(error)
            
        }
    }

}
