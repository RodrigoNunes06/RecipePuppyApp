//
//  RecipeRepositoryImpl.swift
//  RecipePuppyApp
//
//  Created by Rodrigo Nunes on 10/8/19.
//  Copyright © 2019 Rodrigo Nunes Gil. All rights reserved.
//

import Foundation

final class RecipeRepositoryImpl: RecipeRepository {
    
    private let service = RecipesService.shared
    
    func getRecipes(recipe: String,
                    page: Int,
                    completion: @escaping RepositoryResult) {
        service.getRecipes(query: recipe, page: page) { result in
            switch result {
            case let .success(recipiesEntityArray):
                let recipies = recipiesEntityArray.map { recipeEntity in
                    return RecipeEntityDataMapper().transform(entity: recipeEntity)
                }
                completion(.success(recipies))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
    
    func getFavoriteRecipes() -> [Recipe] {
        let recipes = LocalDataManager.loadAll(type: RecipeEntity.self).map { recipeEntity in
            return RecipeEntityDataMapper().transform(entity: recipeEntity)
        }
        return recipes
    }
    
    func saveFavoriteRecipe(recipe: Recipe) throws {
        let recipeEntity = RecipeEntityDataMapper().inverseTransform(domain: recipe)
        do {
            try LocalDataManager.save(object: recipeEntity, with: recipeEntity.title)
        } catch {
            throw(error)
        }
    }
}
