//
//  ParameterEncoding.swift
//  RecipePuppyApp
//
//  Created by Rodrigo Nunes on 10/7/19.
//  Copyright © 2019 Rodrigo Nunes Gil. All rights reserved.
//

import Foundation

public protocol ParameterEncoder {
    static func encode(urlRequest: inout URLRequest, parameters: Parameters) throws
}

public struct URLParameterEncoder: ParameterEncoder {
    public static func encode(urlRequest: inout URLRequest, parameters: Parameters) throws {
        guard let url = urlRequest.url else { throw NetworkError.missingURL }
        
        if var urlComponents = URLComponents(url: url,
                                             resolvingAgainstBaseURL: false), !parameters.isEmpty {
            urlComponents.queryItems = [URLQueryItem]()
            
            parameters.forEach { (key, value) in
                let queryItem = URLQueryItem(name: key,
                                             value: "\(value)")
                urlComponents.queryItems?.append(queryItem)
            }
            urlRequest.url = urlComponents.url
        }
        
        if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
            urlRequest.setValue("application/x-www-form-urlencoded; charset=utf-8",
                                forHTTPHeaderField: "Content-Type")
        }
    }
}

public struct JSONParameterEncoder: ParameterEncoder {
    public static func encode(urlRequest: inout URLRequest, parameters: Parameters) throws {
        do {
            let data = try JSONSerialization.data(withJSONObject: parameters,
                                                  options: .prettyPrinted)
            urlRequest.httpBody = data
            if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
                urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            }
        } catch {
            throw NetworkError.encodingFailed
        }
    }
}
