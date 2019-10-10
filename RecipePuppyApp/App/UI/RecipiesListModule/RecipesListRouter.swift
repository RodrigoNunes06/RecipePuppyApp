//
//  RecipiesListRouter.swift
//  RecipePuppyApp
//
//  Created by Rodrigo Nunes on 09.10.2019.
//  Copyright © 2019 Rodrigo Nunes. All rights reserved.
//

import Foundation
import UIKit

//sourcery: AutoMockable
protocol RecipesListRouterInterface: class {
    func showFavoritesScreen()
    func showWebView(url: URL)
}

class RecipesListRouter {

    weak var presenter: RecipesListPresenterInterface?

    static func setupModule() -> RecipesListViewController {
        let vc = RecipesListViewController()
        let interactor = RecipesListInteractor(getRecipesUseCase: GetRecipeUseCase())
        let router = RecipesListRouter()
        let presenter = RecipesListPresenter(interactor: interactor, router: router, view: vc)

        vc.presenter = presenter
        router.presenter = presenter
        interactor.presenter = presenter
        return vc
    }
}

extension RecipesListRouter: RecipesListRouterInterface {
    func showWebView(url: URL) {
        
    }
    
    func showFavoritesScreen() {
        
    }
}

