//
//  NetworkError.swift
//  RecipePuppyApp
//
//  Created by Rodrigo Nunes on 10/8/19.
//  Copyright © 2019 Rodrigo Nunes Gil. All rights reserved.
//

import Foundation

enum NetworkError : String, Error {
    case parametersNil = "Parameters were nil"
    case encodingFailed = "Parameter encoding failed"
    case missingURL = "URL is nil"
}

enum NetworkResponseError: String, Error {
    case noData = "No data"
    case unableToDecode = "Unable to decode"
}
