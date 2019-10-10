//
//  FavoriteRecipiesListViewController.swift
//  CIViperGenerator
//
//  Created by Rodrigo Nunes on 10.10.2019.
//  Copyright © 2019 Rodrigo Nunes. All rights reserved.
//

import UIKit

protocol FavoriteRecipiesListViewControllerInterface: class {

}

class FavoriteRecipiesListViewController: UIViewController {
    var presenter: FavoriteRecipiesListPresenterInterface?
}

extension FavoriteRecipiesListViewController: FavoriteRecipiesListViewControllerInterface {

}
