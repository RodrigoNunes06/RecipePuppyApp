//
//  RecipesListInteractor.swift
//  RecipePuppyApp
//
//  Created by Rodrigo Nunes on 09.10.2019.
//  Copyright © 2019 Rodrigo Nunes. All rights reserved.
//

import Foundation

//sourcery: AutoMockable
protocol RecipesListInteractorInterface: class {
    func getRecipes(query: String, page: Int, completion: @escaping ([Recipe]?, Error?) -> ())
}

class RecipesListInteractor {
    weak var presenter: RecipesListPresenterInterface?
    private let getRecipesUseCase: GetRecipeUseCaseInterface
    
    init(getRecipesUseCase: GetRecipeUseCaseInterface) {
        self.getRecipesUseCase = getRecipesUseCase
    }
}

extension RecipesListInteractor: RecipesListInteractorInterface {
    func getRecipes(query: String, page: Int, completion: @escaping ([Recipe]?, Error?) -> ()) {
        getRecipesUseCase.execute(recipe: query, page: page, completion: { result in
            switch result {
            case let .success(recipes):
                completion(recipes, nil)
            case let .failure(error):
                completion(nil, error)
            }
        })
    }
}
