//
//  RecipesListPresenter.swift
//  RecipePuppyApp
//
//  Created by Rodrigo Nunes on 09.10.2019.
//  Copyright © 2019 Rodrigo Nunes. All rights reserved.
//

import Foundation

//sourcery: AutoMockable
protocol RecipesListPresenterInterface: class {
    func viewModelForIndex(_ index: Int) -> RecipeCollectionCellViewModel
    func onTapFavorite(_ index: Int)
    func onTapCellWithIndex(_ index: Int)
    func onPagination()
    func onTapShowFavorites()
    func onSearchRecipe(recipe: String)
    func recipesAmount() -> Int
}

class RecipesListPresenter {
    unowned private var view: RecipesListViewControllerInterface
    private let router: RecipesListRouterInterface?
    private let interactor: RecipesListInteractorInterface?
    private var recipes: [Recipe]?
    private var currentPage = 1
    private var currentQuery = ""
    private var isPaginating = false

    init(interactor: RecipesListInteractorInterface, router: RecipesListRouterInterface, view: RecipesListViewControllerInterface) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension RecipesListPresenter: RecipesListPresenterInterface {
    func viewModelForIndex(_ index: Int) -> RecipeCollectionCellViewModel {
        guard let recipe = recipes?[index] else { fatalError("Recipe for index is nil") }
        let viewModel = RecipeCollectionCellViewModel(name: recipe.title,
                                                      ingredients: recipe.ingredients,
                                                      imageURL: recipe.imageURL,
                                                      hasLactose: hasLactose(recipe: recipe))
        return viewModel
    }
    
    func onTapFavorite(_ index: Int) {
        guard let recipe = recipes?[index] else { return }
        do {
            try interactor?.saveRecipe(recipe: recipe)
            view.showSavedAlert()
        } catch {
            //TODO: show error alert
        }
    }
    
    func onTapCellWithIndex(_ index: Int) {
        guard let recipe = recipes?[index],
            let url = URL(string: recipe.href) else { return }
        router?.showWebView(url: url)
    }
    
    func onPagination() {
        guard !isPaginating else { return }
        isPaginating = true
        currentPage += 1
        interactor?.getRecipes(query: currentQuery, page: currentPage, completion: { [weak self] (recipes, error) in
            guard let self = self else { return }
            if let error = error { print(error.localizedDescription) }
            if let recipes = recipes, let currentCount = self.recipes?.count, !recipes.isEmpty {
                self.recipes?.append(contentsOf: recipes)
                var indexArray = [Int]()
                indexArray.append(contentsOf: currentCount..<self.recipes!.endIndex)
                self.view.appendData(at: indexArray)
                self.isPaginating = false
            }
        })
    }
    
    func onTapShowFavorites() {
        router?.showFavoritesScreen()
    }
    
    func onSearchRecipe(recipe: String) {
        view.showLoading()
        currentQuery = recipe
        currentPage = 1
        interactor?.getRecipes(query: recipe, page: currentPage, completion: { [weak self] (recipes, error) in
            guard let self = self else { return }
            if let error = error { print(error.localizedDescription) }
            if let recipes = recipes {
                self.recipes = recipes
                self.view.hideLoading()
                self.view.reloadData()
            }
        })
    }
    
    func recipesAmount() -> Int {
        return recipes?.count ?? 0
    }
}

private extension RecipesListPresenter {
    func hasLactose(recipe: Recipe) -> Bool {
        let ingredients = recipe.ingredients
        return ingredients.contains("cheese") || ingredients.contains("milk")
    }
}
