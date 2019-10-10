//
//  RecipiesListViewController.swift
//  RecipePuppyApp
//
//  Created by Rodrigo Nunes on 09.10.2019.
//  Copyright © 2019 Rodrigo Nunes. All rights reserved.
//

import UIKit

//sourcery: AutoMockable
protocol RecipesListViewControllerInterface: class {
    func showLoading()
    func hideLoading()
    func reloadData()
    func appendData(at indexes: [Int])
}

class RecipesListViewController: UIViewController {
    @IBOutlet private var searchBar: UISearchBar!
    @IBOutlet private var collectionView: UICollectionView!
    @IBOutlet private var flowLayout: UICollectionViewFlowLayout!
    @IBOutlet private var activityIndicator: UIActivityIndicatorView!
    
    var presenter: RecipesListPresenterInterface?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupSearchBar()
        setupFlowLayout()
        setupCollectionView()
        setupActivityIndicator()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter?.onSearchRecipe(recipe: "omelet")
    }
}

extension RecipesListViewController: RecipesListViewControllerInterface {
    func showLoading() {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }
    
    func hideLoading() {
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
    }
    
    func reloadData() {
        collectionView.reloadData()
    }
    
    func appendData(at indexes: [Int]) {
        let indexPathArray = indexes.map { IndexPath(item: $0, section: 0) }
        collectionView.performBatchUpdates({
            collectionView.insertItems(at: indexPathArray)
        }, completion: nil)
    }
}

private extension RecipesListViewController {
    
    func setupNavigationBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Recipes"
        self.navigationController?.navigationBar.barTintColor = .white
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
        collectionView.backgroundColor = .gray
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(UINib(nibName: RecipeCollectionViewCell.preferredNibName(),bundle: nil),
                                forCellWithReuseIdentifier: RecipeCollectionViewCell.reuseIdentifier())
    }
    
    func setupSearchBar() {
        searchBar.delegate = self
    }
    
    func setupActivityIndicator() {
        activityIndicator.isHidden = true
        activityIndicator.layer.cornerRadius = 4
    }
}

extension RecipesListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
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
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let lastElement = collectionView.indexPathsForVisibleItems.filter({
            let numberOfItems = IndexPath(item: collectionView.numberOfItems(inSection: 0) - 3, section: 0)
            return $0 == numberOfItems
        })
        if !lastElement.isEmpty {
            presenter?.onPagination()
        }
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

extension RecipesListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { return }
        presenter?.onSearchRecipe(recipe: text)
        searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

