//
//  RecipiesEndpoint.swift
//  RecipePuppyApp
//
//  Created by Rodrigo Nunes on 10/8/19.
//  Copyright © 2019 Rodrigo Nunes Gil. All rights reserved.
//

import Foundation

enum RecipeEndPoint {
    case searchRecipe(query: String, page: Int)
}

extension RecipeEndPoint: NetworkEndPoint {
    var baseURL: URL {
        guard let url = URL(string:NetworkConstants.baseURL) else { fatalError("baseURL error") }
        return url
    }
    
    var path: String {
        switch self {
        case let .searchRecipe(query, page):
            return "?q=\(query)&p=\(page)"
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        return .plainRequest
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}
