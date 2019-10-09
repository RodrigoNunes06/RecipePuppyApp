//
//  RecipeRepositoryImpl.swift
//  RecipePuppyApp
//
//  Created by Rodrigo Nunes on 10/8/19.
//  Copyright © 2019 Rodrigo Nunes Gil. All rights reserved.
//

import Foundation

final class RecipeRepositoryImpl: RecipeRepository {
    private let service: RecipiesServiceApi
    
    init(service: RecipiesServiceApi) {
        self.service = service
    }
    
    func searchRecipes(recipe: String,
                       page: Int,
                       completion: @escaping(Result<[Recipe], Error>) -> Void) {
        service.getRecipies(query: recipe, page: page) { result in
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
