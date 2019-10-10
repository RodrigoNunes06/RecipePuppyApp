//
//  FavoriteRecipiesListPresenter.swift
//  CIViperGenerator
//
//  Created by Rodrigo Nunes on 10.10.2019.
//  Copyright © 2019 Rodrigo Nunes. All rights reserved.
//

import Foundation

protocol FavoriteRecipiesListPresenterInterface: class {

}

class FavoriteRecipiesListPresenter {

    unowned var view: FavoriteRecipiesListViewControllerInterface
    let router: FavoriteRecipiesListRouterInterface?
    let interactor: FavoriteRecipiesListInteractorInterface?

    init(interactor: FavoriteRecipiesListInteractorInterface, router: FavoriteRecipiesListRouterInterface, view: FavoriteRecipiesListViewControllerInterface) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension FavoriteRecipiesListPresenter: FavoriteRecipiesListPresenterInterface {

}
