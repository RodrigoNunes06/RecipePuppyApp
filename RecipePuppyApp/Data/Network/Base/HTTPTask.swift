//
//  HTTPTask.swift
//  RecipePuppyApp
//
//  Created by Rodrigo Nunes on 10/7/19.
//  Copyright © 2019 Rodrigo Nunes Gil. All rights reserved.
//

import Foundation

public typealias HTTPHeaders = [String : String]
public typealias Parameters = [String : Any]

public enum HTTPTask {
    case plainRequest
    case request(bodyParameters: Parameters?,
        urlParameters: Parameters?)
    case requestWithHeaders(bodyParameters: Parameters?,
        urlParameters: Parameters?,
        additionalHeaders: HTTPHeaders?)
}
