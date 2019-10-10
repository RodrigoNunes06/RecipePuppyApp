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
        return Domain(title: entity.title,
                      ingredients: entity.ingredients,
                      imageURL: entity.imageURL,
                      href: entity.href)
    }
    
    func inverseTransform(domain: Domain) -> Entity {
        return Entity(title: domain.title,
                      ingredients: domain.ingredients,
                      imageURL: domain.imageURL,
                      href: domain.href)
    }
}

