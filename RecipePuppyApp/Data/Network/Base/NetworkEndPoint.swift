//
//  NetowekEndpoint.swift
//  RecipePuppyApp
//
//  Created by Rodrigo Nunes on 10/7/19.
//  Copyright © 2019 Rodrigo Nunes Gil. All rights reserved.
//

import Foundation

//sourcery: AutoMockable
protocol NetworkEndPoint {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
}
