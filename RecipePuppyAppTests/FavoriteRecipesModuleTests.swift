//
//  FavoriteRecipesModuleTests.swift
//  RecipePuppyAppTests
//
//  Created by Rodrigo Nunes on 10/11/19.
//  Copyright © 2019 Rodrigo Nunes Gil. All rights reserved.
//

import XCTest
import SwiftyMocky

@testable import RecipePuppyApp

class FavoriteRecipesPresenterTests: XCTestCase {
    var presenter: FavoriteRecipesListPresenterInterface?
    let interactorMock = FavoriteRecipesListInteractorInterfaceMock(sequencing: .lastWrittenResolvedFirst, stubbing: .wrap)
    let routerMock = FavoriteRecipesListRouterInterfaceMock(sequencing: .lastWrittenResolvedFirst, stubbing: .wrap)
    let viewMock = FavoriteRecipesListViewControllerInterfaceMock(sequencing: .lastWrittenResolvedFirst, stubbing: .wrap)
    let recipe = Recipe(title: "pasta",
                        ingredients: "cheese",
                        imageURL: "imageURL",
                        href: "www.google.com")

    override func setUp() {
        super.setUp()
        presenter = FavoriteRecipesListPresenter(interactor: interactorMock,
                                                 router: routerMock,
                                                 view: viewMock)
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testOnViewDidLoad() {
        Given(interactorMock, .getFavoriteRecipes(willReturn: [recipe]))
        presenter?.onViewDidLoad()
        Verify(interactorMock, .getFavoriteRecipes())
        Verify(viewMock, .reloadData())
    }
    
    func testRecipesAmount() {
        getFavoriteRecipes()
        let expectedAmount = 1
        let amount = presenter?.recipesAmount()
        XCTAssertEqual(amount, expectedAmount)
    }
    
    func testOnTapCellWithIndex() {
        getFavoriteRecipes()
        presenter?.onTapCellWithIndex(0)
        Verify(routerMock, .showWebView(url: .value(URL(string: "www.google.com")!)))
    }

    func testViewModelForIndex() {
        getFavoriteRecipes()
        let expectedViewModel = RecipeCollectionCellViewModel(name: recipe.title,
                                                              ingredients: recipe.ingredients,
                                                              imageURL: recipe.imageURL,
                                                              hasLactose: true)
        let viewModel = presenter?.viewModelForIndex(0)
        XCTAssertEqual(viewModel, expectedViewModel)
    }
}

private extension FavoriteRecipesPresenterTests {
    func getFavoriteRecipes() {
        Given(interactorMock, .getFavoriteRecipes(willReturn: [recipe]))
        presenter?.onViewDidLoad()
    }
}
