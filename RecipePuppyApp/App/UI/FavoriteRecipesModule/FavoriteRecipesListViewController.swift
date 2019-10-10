//
//  FavoriteRecipiesListViewController.swift
//  CIViperGenerator
//
//  Created by Rodrigo Nunes on 10.10.2019.
//  Copyright © 2019 Rodrigo Nunes. All rights reserved.
//

import UIKit

protocol FavoriteRecipesListViewControllerInterface: class {

}

class FavoriteRecipesListViewController: UIViewController {
    var presenter: FavoriteRecipesListPresenterInterface?
}

extension FavoriteRecipesListViewController: FavoriteRecipesListViewControllerInterface {

}
