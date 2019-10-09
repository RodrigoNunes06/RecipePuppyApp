//
//  Recipe.swift
//  RecipePuppyApp
//
//  Created by Rodrigo Nunes on 10/8/19.
//  Copyright © 2019 Rodrigo Nunes Gil. All rights reserved.
//

import Foundation

struct Recipe {
    let title: String
    let ingredients: String
    let imageURL: String
    
    init(title: String = "", ingredients: String = "", imageURL: String = "") {
        self.title = title
        self.ingredients = ingredients
        self.imageURL = imageURL
    }
}
