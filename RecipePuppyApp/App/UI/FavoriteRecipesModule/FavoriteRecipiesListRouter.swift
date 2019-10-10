//
//  FavoriteRecipiesListRouter.swift
//  CIViperGenerator
//
//  Created by Rodrigo Nunes on 10.10.2019.
//  Copyright © 2019 Rodrigo Nunes. All rights reserved.
//

import Foundation
import UIKit

protocol FavoriteRecipiesListRouterInterface: class {

}

class FavoriteRecipiesListRouter: NSObject {

    weak var presenter: FavoriteRecipiesListPresenterInterface?

    static func setupModule() -> FavoriteRecipiesListViewController {
        let vc = FavoriteRecipiesListViewController()
        let interactor = FavoriteRecipiesListInteractor()
        let router = FavoriteRecipiesListRouter()
        let presenter = FavoriteRecipiesListPresenter(interactor: interactor, router: router, view: vc)

        vc.presenter = presenter
        router.presenter = presenter
        interactor.presenter = presenter
        return vc
    }
}

extension FavoriteRecipiesListRouter: FavoriteRecipiesListRouterInterface {

}

