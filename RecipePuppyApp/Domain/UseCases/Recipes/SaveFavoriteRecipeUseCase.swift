//
//  SaveFavoriteRecipeUseCase.swift
//  RecipePuppyApp
//
//  Created by Rodrigo Nunes on 10/10/19.
//  Copyright © 2019 Rodrigo Nunes Gil. All rights reserved.
//

import Foundation

protocol SaveFavoriteRecipeUseCaseInterface {
    func execute(recipe: Recipe) throws
}

struct SaveFavoriteRecipeUseCase: SaveFavoriteRecipeUseCaseInterface {
    private let repository = RecipeRepositoryImpl()
    
    func execute(recipe: Recipe) throws {
        do {
            try repository.saveFavoriteRecipe(recipe: recipe)
        } catch {
            throw(error)
        }
    }
}
