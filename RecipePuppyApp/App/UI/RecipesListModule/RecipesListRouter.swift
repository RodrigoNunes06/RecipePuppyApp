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
    weak var navigationController: UINavigationController?

    static func setupModule() -> UINavigationController {
        let vc = RecipesListViewController()
        let interactor = RecipesListInteractor(getRecipesUseCase: GetRecipeUseCase(),
                                               saveFavoriteRecipeUseCase: SaveFavoriteRecipeUseCase())
        let router = RecipesListRouter()
        let presenter = RecipesListPresenter(interactor: interactor, router: router, view: vc)
        let navigationController = UINavigationController(rootViewController: vc)
        vc.presenter = presenter
        router.presenter = presenter
        router.navigationController = navigationController
        interactor.presenter = presenter
        return navigationController
    }
}

extension RecipesListRouter: RecipesListRouterInterface {
    func showWebView(url: URL) {
        let webViewController = WebViewController(url: url)
        navigationController?.present(webViewController, animated: true, completion: nil)
    }
    
    func showFavoritesScreen() {
        
    }
}

