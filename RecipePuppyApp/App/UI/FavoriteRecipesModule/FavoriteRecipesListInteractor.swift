//
//  FavoriteRecipiesListInteractor.swift
//  CIViperGenerator
//
//  Created by Rodrigo Nunes on 10.10.2019.
//  Copyright © 2019 Rodrigo Nunes. All rights reserved.
//

import Foundation

protocol FavoriteRecipesListInteractorInterface: class {

}

class FavoriteRecipesListInteractor {
    weak var presenter: FavoriteRecipesListPresenterInterface?
}

extension FavoriteRecipesListInteractor: FavoriteRecipesListInteractorInterface {

}
