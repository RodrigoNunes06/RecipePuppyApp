//
//  FavoriteRecipiesListRouter.swift
//  CIViperGenerator
//
//  Created by Rodrigo Nunes on 10.10.2019.
//  Copyright © 2019 Rodrigo Nunes. All rights reserved.
//

import Foundation
import UIKit

protocol FavoriteRecipesListRouterInterface: class {

}

class FavoriteRecipesListRouter: NSObject {

    weak var presenter: FavoriteRecipesListPresenterInterface?

    static func setupModule() -> FavoriteRecipesListViewController {
        let vc = FavoriteRecipesListViewController()
        let interactor = FavoriteRecipesListInteractor()
        let router = FavoriteRecipesListRouter()
        let presenter = FavoriteRecipesListPresenter(interactor: interactor, router: router, view: vc)

        vc.presenter = presenter
        router.presenter = presenter
        interactor.presenter = presenter
        return vc
    }
}

extension FavoriteRecipesListRouter: FavoriteRecipesListRouterInterface {

}

