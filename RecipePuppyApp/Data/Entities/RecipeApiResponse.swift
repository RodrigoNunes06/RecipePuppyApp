//
//  RecipeApiResponse.swift
//  RecipePuppyApp
//
//  Created by Rodrigo Nunes on 10/9/19.
//  Copyright © 2019 Rodrigo Nunes Gil. All rights reserved.
//

import Foundation

struct RecipeApiResponse {
    let title: String
    let version: Int
    let href: String
    let recipies: [RecipeEntity]
}

extension RecipeApiResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case title
        case version
        case href
        case recipies = "results"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        title = try container.decode(String.self, forKey: .title)
        version = try container.decode(Int.self, forKey: .version)
        href = try container.decode(String.self, forKey: .href)
        recipies = try container.decode([RecipeEntity].self, forKey: .recipies)
    }
}
