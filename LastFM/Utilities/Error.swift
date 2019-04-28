//
//  Error.swift
//  LastFM
//
//  Created by Apple on 19/04/2019.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

protocol CustomErrorProtocol: LocalizedError {
    
    var title: String? { get }
    var code: Int { get }
}

struct CustomError: CustomErrorProtocol {
    
    var title: String?
    var code: Int
    var errorDescription: String? { return _description }
    var failureReason: String? { return _description }
    
    private var _description: String
    
    init(title: String?, description: String, code: Int) {
        self.title = title ?? "Error"
        self._description = description
        self.code = code
    }
}

enum ErrorDescription {
    static let error            = "Error"
    static let noRecordFound    = "No record found. Please try again"
    static let somethingWrong   = "Something is wrong. Please try again"
    static let searchIsEmpty    = "Search field cannot be empty. Please enter some text to search."
    
}
