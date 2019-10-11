//
//  FavoriteRecipiesListInteractor.swift
//  RecipePuppyApp
//
//  Created by Rodrigo Nunes on 10.10.2019.
//  Copyright © 2019 Rodrigo Nunes. All rights reserved.
//

import Foundation

//sourcery: AutoMockable
protocol FavoriteRecipesListInteractorInterface: class {
    func getFavoriteRecipes() -> [Recipe]
}

class FavoriteRecipesListInteractor {
    weak var presenter: FavoriteRecipesListPresenterInterface?
    private let getFavoriteRecipesUseCase: GetFavoriteRecipesUseCaseInterface
    
    init(getFavoriteRecipesUseCase: GetFavoriteRecipesUseCaseInterface) {
        self.getFavoriteRecipesUseCase = getFavoriteRecipesUseCase
    }
}

extension FavoriteRecipesListInteractor: FavoriteRecipesListInteractorInterface {
    func getFavoriteRecipes() -> [Recipe] {
        return getFavoriteRecipesUseCase.execute()
    }
}
