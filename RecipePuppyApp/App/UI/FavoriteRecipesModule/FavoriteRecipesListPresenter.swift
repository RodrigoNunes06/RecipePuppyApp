//
//  FavoriteRecipiesListPresenter.swift
//  RecipePuppyApp
//
//  Created by Rodrigo Nunes on 10.10.2019.
//  Copyright © 2019 Rodrigo Nunes. All rights reserved.
//

import Foundation

//sourcery: AutoMockable
protocol FavoriteRecipesListPresenterInterface: class {
    func onViewDidLoad()
    func viewModelForIndex(_ index: Int) -> RecipeCollectionCellViewModel
    func onTapCellWithIndex(_ index: Int)
    func recipesAmount() -> Int
}

class FavoriteRecipesListPresenter {
    unowned var view: FavoriteRecipesListViewControllerInterface
    let router: FavoriteRecipesListRouterInterface?
    let interactor: FavoriteRecipesListInteractorInterface?
    private var recipes: [Recipe]?

    init(interactor: FavoriteRecipesListInteractorInterface, router: FavoriteRecipesListRouterInterface, view: FavoriteRecipesListViewControllerInterface) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension FavoriteRecipesListPresenter: FavoriteRecipesListPresenterInterface {
    
    func onViewDidLoad() {
        recipes = interactor?.getFavoriteRecipes()
        view.reloadData()
    }
    
    func viewModelForIndex(_ index: Int) -> RecipeCollectionCellViewModel {
        guard let recipe = recipes?[index] else { fatalError("Recipe for index is nil") }
        let viewModel = RecipeCollectionCellViewModel(name: recipe.title,
                                                      ingredients: recipe.ingredients,
                                                      imageURL: recipe.imageURL,
                                                      hasLactose: hasLactose(recipe: recipe))
        return viewModel
    }
    
    func onTapCellWithIndex(_ index: Int) {
        guard let recipe = recipes?[index],
            let url = URL(string: recipe.href) else { return }
        router?.showWebView(url: url)
    }
    
    func recipesAmount() -> Int {
        return recipes?.count ?? 0
    }
}

private extension FavoriteRecipesListPresenter {
    func hasLactose(recipe: Recipe) -> Bool {
        let ingredients = recipe.ingredients
        return ingredients.contains("cheese") || ingredients.contains("milk")
    }
}

