//
//  RecipeRepository.swift
//  RecipePuppyApp
//
//  Created by Rodrigo Nunes on 10/8/19.
//  Copyright © 2019 Rodrigo Nunes Gil. All rights reserved.
//

import Foundation

typealias RepositoryResult = (Result<[Recipe], Error>) -> ()

protocol RecipeRepository {
    func getRecipes(recipe: String,
                    page: Int,
                    completion: @escaping RepositoryResult)
    
    func getFavoriteRecipes() -> [Recipe]
    func saveFavoriteRecipe(recipe: Recipe) throws
}
