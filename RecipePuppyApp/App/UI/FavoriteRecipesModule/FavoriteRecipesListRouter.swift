//
//  FavoriteRecipiesListRouter.swift
//  RecipePuppyApp
//
//  Created by Rodrigo Nunes on 10.10.2019.
//  Copyright © 2019 Rodrigo Nunes. All rights reserved.
//

import Foundation
import UIKit

//sourcery: AutoMockable
protocol FavoriteRecipesListRouterInterface: class {
    func showWebView(url: URL)
}

class FavoriteRecipesListRouter: NSObject {
    weak var presenter: FavoriteRecipesListPresenterInterface?
    weak var navigationController: UINavigationController?

    static func setupModule(navigationController: UINavigationController) -> FavoriteRecipesListViewController {
        let vc = FavoriteRecipesListViewController()
        let interactor = FavoriteRecipesListInteractor(getFavoriteRecipesUseCase: GetFavoriteRecipesUseCase())
        let router = FavoriteRecipesListRouter()
        let presenter = FavoriteRecipesListPresenter(interactor: interactor, router: router, view: vc)

        vc.presenter = presenter
        router.presenter = presenter
        router.navigationController = navigationController
        interactor.presenter = presenter
        return vc
    }
}

extension FavoriteRecipesListRouter: FavoriteRecipesListRouterInterface {
    func showWebView(url: URL) {
        let webViewController = WebViewController(url: url)
        navigationController?.present(webViewController, animated: true, completion: nil)
    }
}

