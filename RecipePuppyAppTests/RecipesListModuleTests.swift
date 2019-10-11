//
//  RecipesListModuleTests.swift
//  RecipePuppyAppTests
//
//  Created by Rodrigo Nunes on 10/11/19.
//  Copyright © 2019 Rodrigo Nunes Gil. All rights reserved.
//

import XCTest
import SwiftyMocky
@testable import RecipePuppyApp

class RecipesListPresenterTests: XCTestCase {
    var presenter: RecipesListPresenterInterface?
    let interactorMock = RecipesListInteractorInterfaceMock(sequencing: .lastWrittenResolvedFirst, stubbing: .wrap)
    let routerMock = RecipesListRouterInterfaceMock(sequencing: .lastWrittenResolvedFirst, stubbing: .wrap)
    let viewMock = RecipesListViewControllerInterfaceMock(sequencing: .lastWrittenResolvedFirst, stubbing: .wrap)

    override func setUp() {
        super.setUp()
        presenter = RecipesListPresenter(interactor: interactorMock,
                                         router: routerMock,
                                         view: viewMock)
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testRecipesAmount() {
        let expectedAmount = 4
        performGetRecipiesRequest()
        performPaginationRequest()
        let amount = presenter?.recipesAmount()
        XCTAssertEqual(amount, expectedAmount)
    }
    
    func testOnSearchRecipe() {
        performGetRecipiesRequest()
        Verify(viewMock, .showLoading())
        Verify(interactorMock, .getRecipes(query: .value("omelet"),
                                           page: .value(1),
                                           completion: .any))
        Verify(viewMock, .hideLoading())
        Verify(viewMock, .reloadData())
    }
    
    func testOnTapShowFavorites() {
        presenter?.onTapShowFavorites()
        Verify(routerMock, .showFavoritesScreen())
    }
    
    func testOnPagination() {
        performGetRecipiesRequest()
        performPaginationRequest()
        Verify(interactorMock, .getRecipes(query: .value("omelet"), page: .value(2), completion: .any))
        Verify(viewMock, .appendData(at: [1,2,3]))
    }
    
    func testOnTapFavorite() {
        let recipe = Recipe(title: "omelet",
                            ingredients: "ingredients",
                            imageURL: "imageURL",
                            href: "www.google.com")
        performGetRecipiesRequest()
        presenter?.onTapFavorite(0)
        Verify(interactorMock, .saveRecipe(recipe: .value(recipe)))
        Verify(viewMock, .showSavedAlert())
    }
    
    func testOnTapCellWithIndex() {
        performGetRecipiesRequest()
        presenter?.onTapCellWithIndex(0)
        Verify(routerMock, .showWebView(url: .value(URL(string: "www.google.com")!)))
    }

    func testViewModelForIndex() {
        performGetRecipiesRequest()
        performPaginationRequest()
        let expectedViewModel = RecipeCollectionCellViewModel(name: "omelet",
                                                              ingredients: "ingredients",
                                                              imageURL: "imageURL",
                                                              hasLactose: false)
        let viewModel = presenter?.viewModelForIndex(0)
        XCTAssertEqual(viewModel, expectedViewModel)
    }
}

private extension RecipesListPresenterTests {
    func performGetRecipiesRequest() {
        let recipe = Recipe(title: "omelet",
                            ingredients: "ingredients",
                            imageURL: "imageURL",
                            href: "www.google.com")
        Perform(interactorMock, .getRecipes(query: .value("omelet"),
                                            page: .value(1),
                                            completion: .any,
                                            perform: { (title, page, completion) in
            completion([recipe], nil)
        }))
        presenter?.onSearchRecipe(recipe: "omelet")
    }
    
    func performPaginationRequest() {
        let recipe = Recipe(title: "omelet",
                            ingredients: "ingredients",
                            imageURL: "imageURL",
                            href: "www.google.com")
        Perform(interactorMock, .getRecipes(query: .value("omelet"),
                                            page: .value(2),
                                            completion: .any,
                                            perform: { (title, page, completion) in
            completion([recipe,recipe,recipe], nil)
        }))
        presenter?.onPagination()
    }
}

class RecipesListInteractorTests: XCTestCase {
    var interactor: RecipesListInteractorInterface?
    let getRecipeUseCaseMock = GetRecipeUseCaseInterfaceMock(sequencing: .lastWrittenResolvedFirst, stubbing: .wrap)
    let saveRecipeUseCaseMock = SaveFavoriteRecipeUseCaseInterfaceMock(sequencing: .lastWrittenResolvedFirst, stubbing: .wrap)
    
    override func setUp() {
        super.setUp()
        interactor = RecipesListInteractor(getRecipesUseCase: getRecipeUseCaseMock,
                                           saveFavoriteRecipeUseCase: saveRecipeUseCaseMock)
    }

    override func tearDown() {
        super.tearDown()
    }

    func testGetRecipes() {
        let expectedRecipe = [Recipe(title: "pizza",
                                    ingredients: "ingredients",
                                    imageURL: "imageURL",
                                    href: "www.google.com")]
        Perform(getRecipeUseCaseMock, .execute(recipe: .value("pizza"),
                                               page: .value(1),
                                               completion: .any,
                                               perform: { (title, page, completion) in
                                                completion(.success(expectedRecipe))
        }))
        
        interactor?.getRecipes(query: "pizza", page: 1, completion: { (recipe, error) in
            XCTAssertEqual(recipe, expectedRecipe)
        })
    }
    
    func testSaveRecipe() {
        let recipe = Recipe(title: "pizza",
                            ingredients: "ingredients",
                            imageURL: "imageURL",
                            href: "www.google.com")
        try! interactor?.saveRecipe(recipe: recipe)
        Verify(saveRecipeUseCaseMock, .execute(recipe: .value(recipe)))
    }
}

