//
//  FavoriteRecipiesListViewController.swift
//  RecipePuppyApp
//
//  Created by Rodrigo Nunes on 10.10.2019.
//  Copyright © 2019 Rodrigo Nunes. All rights reserved.
//

import UIKit

//sourcery: AutoMockable
protocol FavoriteRecipesListViewControllerInterface: class {
    func reloadData()
}

class FavoriteRecipesListViewController: UIViewController {
    var presenter: FavoriteRecipesListPresenterInterface?
    @IBOutlet private var collectionView: UICollectionView!
    @IBOutlet private var flowLayout: UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupFlowLayout()
        setupCollectionView()
        presenter?.onViewDidLoad()
    }
}

extension FavoriteRecipesListViewController: FavoriteRecipesListViewControllerInterface {
    func reloadData() {
        collectionView.reloadData()
    }
}

private extension FavoriteRecipesListViewController {
    func setupNavigationBar() {
           navigationController?.navigationBar.prefersLargeTitles = true
           navigationItem.title = "Favorite Recipes"
           navigationController?.navigationBar.barTintColor = .white
       }
       
       func setupFlowLayout() {
           flowLayout.scrollDirection = .vertical
           flowLayout.itemSize = UICollectionViewFlowLayout.automaticSize
           let estimatedWidth = collectionView.bounds.width - 20
           flowLayout.estimatedItemSize = CGSize(width: estimatedWidth, height: 350)
           flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
       }
       
       func setupCollectionView() {
           collectionView.delegate = self
           collectionView.dataSource = self
           collectionView.showsHorizontalScrollIndicator = false
           collectionView.register(UINib(nibName: RecipeCollectionViewCell.preferredNibName(),bundle: nil),
                                   forCellWithReuseIdentifier: RecipeCollectionViewCell.reuseIdentifier())
       }
}

extension FavoriteRecipesListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    //MARK: UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter!.recipesAmount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: RecipeCollectionViewCell.reuseIdentifier(), for: indexPath)
        
        if let recipeCell = collectionViewCell as? RecipeCollectionViewCell {
            recipeCell.setup(viewModel: presenter!.viewModelForIndex(indexPath.item))
        }
        
        return collectionViewCell
    }
    
    //MARK: UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.onTapCellWithIndex(indexPath.item)
    }
    
    //MARK: UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let sectionInset = flowLayout.sectionInset
        let contentInset = collectionView.contentInset
        let estimatedWidth = collectionView.bounds.size.width
            - sectionInset.left
            - sectionInset.right
            - contentInset.left
            - contentInset.right
        return CGSize(width: estimatedWidth, height: 350)
    }
}
