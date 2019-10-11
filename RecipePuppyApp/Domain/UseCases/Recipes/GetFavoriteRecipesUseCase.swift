//
//  GetFavoriteRecipesUseCase.swift
//  RecipePuppyApp
//
//  Created by Rodrigo Nunes on 10/10/19.
//  Copyright © 2019 Rodrigo Nunes Gil. All rights reserved.
//

import Foundation

//sourcery: AutoMockable
protocol GetFavoriteRecipesUseCaseInterface {
    func execute() -> [Recipe]
}

struct GetFavoriteRecipesUseCase: GetFavoriteRecipesUseCaseInterface {
    private let repository = RecipeRepositoryImpl()
    
    func execute() -> [Recipe] {
        return repository.getFavoriteRecipes()
    }
}
