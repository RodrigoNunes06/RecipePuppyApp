//
//  RecipiesService.swift
//  RecipePuppyApp
//
//  Created by Rodrigo Nunes on 10/8/19.
//  Copyright © 2019 Rodrigo Nunes Gil. All rights reserved.
//

import Foundation

final class RecipiesService: Service {
    let router: NetworkRouter
    
    init(router: NetworkRouter) {
        self.router = router as! Router<RecipeEndPoint>
    }
}
