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
                let recipies = recipiesEntityArray.map { recipeEntity -> Recipe in
                    return RecipeEntityDataMapper().transform(entity: recipeEntity)
                }
                completion(.success(recipies))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
