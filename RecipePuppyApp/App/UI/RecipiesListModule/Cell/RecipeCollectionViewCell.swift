//
//  RecipeCollectionViewCell.swift
//  RecipePuppyApp
//
//  Created by Rodrigo Nunes on 10/9/19.
//  Copyright © 2019 Rodrigo Nunes Gil. All rights reserved.
//

import UIKit
import Kingfisher

protocol RecipeCollectionViewCellDelegate: class {
    func didTapFavorite(_ sender: Any)
}

class RecipeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var ingredientsLabel: UILabel!
    @IBOutlet private var favoriteButton: UIButton!
    @IBOutlet private var lactoseLabel: UILabel!
    
    weak var delegate: RecipeCollectionViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.leftAnchor.constraint(equalTo: leftAnchor),
            contentView.rightAnchor.constraint(equalTo: rightAnchor),
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        let widthConstraint = contentView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
        widthConstraint.priority = .init(rawValue: 999)
        widthConstraint.isActive = true
        setupButton()
        setLactoseLabel()
    }
    
    static func preferredNibName() -> String {
        return String(describing: RecipeCollectionViewCell.self)
    }
    
    static func reuseIdentifier() -> String {
        return String(describing: RecipeCollectionViewCell.self)
    }

    func setup(viewModel: RecipeCollectionCellViewModel) {
        titleLabel.text = viewModel.name
        ingredientsLabel.text = viewModel.ingredients
        imageView.kf.setImage(with: URL(string: viewModel.imageURL))
        lactoseLabel.isHidden = !viewModel.hasLactose
    }
}

private extension RecipeCollectionViewCell {
    func setupButton() {
        favoriteButton.layer.cornerRadius = 4.0
        favoriteButton.clipsToBounds = true
    }
    
    func setLactoseLabel() {
        lactoseLabel.text = "Lactose"
        lactoseLabel.textColor = .white
        lactoseLabel.backgroundColor = .blue
        lactoseLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi/4)
    }
    
    @IBAction func onTapFavorite(_ sender: Any) {
        delegate?.didTapFavorite(sender)
    }
}
