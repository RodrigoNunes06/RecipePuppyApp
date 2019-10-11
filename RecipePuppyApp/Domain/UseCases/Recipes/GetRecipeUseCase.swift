//
//  GetRecipeUseCase.swift
//  RecipePuppyApp
//
//  Created by Rodrigo Nunes on 10/9/19.
//  Copyright © 2019 Rodrigo Nunes Gil. All rights reserved.
//

import Foundation

//sourcery: AutoMockable
protocol GetRecipeUseCaseInterface {
    func execute(recipe: String,
                 page: Int,
                 completion: @escaping RepositoryResult)
}

struct GetRecipeUseCase: GetRecipeUseCaseInterface {
    private let repository = RecipeRepositoryImpl()
    
    func execute(recipe: String,
                 page: Int,
                 completion: @escaping RepositoryResult) {
        repository.getRecipes(recipe: recipe, page: page) { result in
            completion(result)
        }
    }
}
