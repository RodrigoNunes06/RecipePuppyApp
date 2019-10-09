//
//  RecipeEntityDataMapper.swift
//  RecipePuppyApp
//
//  Created by Rodrigo Nunes on 10/8/19.
//  Copyright © 2019 Rodrigo Nunes Gil. All rights reserved.
//

import Foundation

struct RecipeEntityDataMapper: DataMapper {
    typealias Entity = RecipeEntity
    typealias Domain = Recipe
    
    func transform(entity: Entity) -> Domain {
        return Domain(title: entity.title ?? "",
                      ingredients: entity.ingredients ?? "",
                      imageURL: entity.imageURL ?? "")
    }
}

