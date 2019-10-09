//
//  RecipeEntity.swift
//  RecipePuppyApp
//
//  Created by Rodrigo Nunes on 10/8/19.
//  Copyright © 2019 Rodrigo Nunes Gil. All rights reserved.
//

import Foundation

struct RecipeEntity {
    let title: String
    let ingredients: String
    let imageURL: String
}

extension RecipeEntity: Decodable {
    private enum CodingKeys: String, CodingKey {
        case title
        case ingredients
        case imageURL = "thumbnail"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        title = try container.decode(String.self, forKey: .title)
        ingredients = try container.decode(String.self, forKey: .ingredients)
        imageURL = try container.decode(String.self, forKey: .imageURL)
    }
}



