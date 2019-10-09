//
//  RecipeRepository.swift
//  RecipePuppyApp
//
//  Created by Rodrigo Nunes on 10/8/19.
//  Copyright © 2019 Rodrigo Nunes Gil. All rights reserved.
//

import Foundation

protocol RecipeRepository {
    func searchRecipes(recipe: String,
                       page: Int,
                       completion: @escaping(Result<[Recipe], Error>) -> Void)
}
