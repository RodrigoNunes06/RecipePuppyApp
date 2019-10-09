//
//  NetworkRouter.swift
//  RecipePuppyApp
//
//  Created by Rodrigo Nunes on 10/8/19.
//  Copyright © 2019 Rodrigo Nunes Gil. All rights reserved.
//

import Foundation

public typealias NetworkRouterCompletion = (_ data: Data?,_ response: URLResponse?,_ error: Error?)->()

protocol NetworkRouter {
    associatedtype EndPoint = NetworkEndPoint
    func request(_ endPoint: EndPoint, completion: @escaping NetworkRouterCompletion)
}

class Router<EndPoint: NetworkEndPoint>: NetworkRouter {
    private var task: URLSessionTask?
    private let requestBuilder: NetworkRequestBuilderApi
    
    init(requestBuilder: NetworkRequestBuilderApi) {
        self.requestBuilder = requestBuilder
    }
    
    func request(_ endPoint: EndPoint, completion: @escaping NetworkRouterCompletion) {
        let session = URLSession.shared
        do {
            let request = try requestBuilder.buildRequest(from: endPoint)
            self.task = session.dataTask(with: request, completionHandler: { (data, response, error) in
                completion(data, response, error)
            })
        } catch {
            completion(nil, nil, error)
        }
        self.task?.resume()
    }
}

