//
//  FavoriteRecipiesListPresenter.swift
//  CIViperGenerator
//
//  Created by Rodrigo Nunes on 10.10.2019.
//  Copyright © 2019 Rodrigo Nunes. All rights reserved.
//

import Foundation

protocol FavoriteRecipesListPresenterInterface: class {

}

class FavoriteRecipesListPresenter {

    unowned var view: FavoriteRecipesListViewControllerInterface
    let router: FavoriteRecipesListRouterInterface?
    let interactor: FavoriteRecipesListInteractorInterface?

    init(interactor: FavoriteRecipesListInteractorInterface, router: FavoriteRecipesListRouterInterface, view: FavoriteRecipesListViewControllerInterface) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension FavoriteRecipesListPresenter: FavoriteRecipesListPresenterInterface {

}
