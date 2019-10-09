//
//  SearchRecipeUseCase.swift
//  RecipePuppyApp
//
//  Created by Rodrigo Nunes on 10/9/19.
//  Copyright © 2019 Rodrigo Nunes Gil. All rights reserved.
//

import Foundation

final class SearchRecipeUseCase: BaseUseCase<RecipeRepository> {
    
    override init(repository: RecipeRepository) {
        super.init(repository: repository)
    }
    
    func execute(recipe: String,
                 page: Int,
                 completion: @escaping(Result<[Recipe], Error>) -> Void) {
        repository.searchRecipes(recipe: recipe, page: page) { result in
            completion(result)
        }
    }
}
