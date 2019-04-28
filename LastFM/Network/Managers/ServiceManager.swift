//
//  ServiceManager.swift
//  LastFM
//
//  Created by Apple on 19/04/2019.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import Alamofire

class ServiceManager: NSObject {
    
    
    @objc static let sharedManager = ServiceManager.init()
    typealias SuccessBlock = (_ response: Any?)->Void
    typealias FaliureBlock = (_ error: Error)->Void
    
    
    /// call the network API
    ///
    /// - Parameters:
    ///   - url: url link to call the API
    ///   - method: HTTP Method
    ///   - params: parameters to paass in the network call
    ///   - completionHandle: success completion handler
    ///   - faliurHandler: failure completion handler
    func callApi(url :String, method: HTTPMethod, params: [String:Any]? = nil, completionHandle:@escaping SuccessBlock , faliurHandler:@escaping FaliureBlock) {
        
        let urlString = url
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        Alamofire.request(urlString,method: .get, parameters: params, encoding:URLEncoding.default, headers: [:]).responseJSON { (response:DataResponse<Any>) in
            
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            switch response.result {
            case .success(let value):
                debugPrint(value)
                completionHandle(value)
                
            case .failure(let error):
                print(error)
                faliurHandler(error)
            }
        }
    }
    
    /// Cancel all the API requests that are in process in the app
    func cancelAllRequests() {
        Alamofire.SessionManager.default.session.getTasksWithCompletionHandler { (sessionDataTask, uploadData, downloadData) in
            sessionDataTask.forEach { $0.cancel() }
            uploadData.forEach { $0.cancel() }
            downloadData.forEach { $0.cancel() }
        }
    }

}
