//
//  FavoriteRecipiesListInteractor.swift
//  CIViperGenerator
//
//  Created by Rodrigo Nunes on 10.10.2019.
//  Copyright © 2019 Rodrigo Nunes. All rights reserved.
//

import Foundation

protocol FavoriteRecipiesListInteractorInterface: class {

}

class FavoriteRecipiesListInteractor {
    weak var presenter: FavoriteRecipiesListPresenterInterface?
}

extension FavoriteRecipiesListInteractor: FavoriteRecipiesListInteractorInterface {

}
