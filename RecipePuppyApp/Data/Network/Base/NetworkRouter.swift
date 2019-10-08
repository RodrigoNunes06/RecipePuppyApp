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
    typealias EndPoint = NetworkEndPoint
    func request(_ endPoint: EndPoint, completion: @escaping NetworkRouterCompletion)
}

class Router<EndPoint: NetworkEndPoint>: NetworkRouter {
    private var task: URLSessionTask?
    
    func request(_ endPoint: NetworkEndPoint, completion: @escaping NetworkRouterCompletion) {
        let session = URLSession.shared
        do {
            let request = try self.buildRequest(from: endPoint)
            self.task = session.dataTask(with: request, completionHandler: { (data, response, error) in
                completion(data, response, error)
            })
        } catch {
            completion(nil, nil, error)
        }
        self.task?.resume()
    }
}

private extension Router {
    func buildRequest(from endPoint: NetworkEndPoint) throws -> URLRequest {
        var request = URLRequest(url: endPoint.baseURL.appendingPathComponent(endPoint.path),
                                 cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                                 timeoutInterval: 10.0)
        
        request.httpMethod = endPoint.httpMethod.rawValue
        
        do {
            switch endPoint.task {
            case .plainRequest:
                request.setValue("application/json",
                                 forHTTPHeaderField: "Content-Type")
            case let .request(bodyParameters, urlParameters):
                try self.configureParameters(bodyParameters: bodyParameters,
                                             urlParameters: urlParameters,
                                             request: &request)
            case let .requestWithHeaders(bodyParameters, urlParameters, additionalHeaders):
                self.addAdditionalHeaders(additionalHeaders, request: &request)
                try self.configureParameters(bodyParameters: bodyParameters,
                                             urlParameters: urlParameters,
                                             request: &request)
            }
            return request
        } catch {
            throw error
        }
    }
    
    func configureParameters(bodyParameters: Parameters?,
                             urlParameters: Parameters?,
                             request: inout URLRequest) throws {
        do {
            if let bodyParameters = bodyParameters {
                try JSONParameterEncoder.encode(urlRequest: &request, parameters: bodyParameters)
            }
            if let urlParameters = urlParameters {
                try URLParameterEncoder.encode(urlRequest: &request, parameters: urlParameters)
            }
        } catch {
            throw error
        }
    }
    
    func addAdditionalHeaders(_ additionalHeaders : HTTPHeaders?, request: inout URLRequest) {
        guard let headers = additionalHeaders else { return }
        headers.forEach { (key, value) in
            request.setValue(value, forHTTPHeaderField: key)
        }
    }
}
