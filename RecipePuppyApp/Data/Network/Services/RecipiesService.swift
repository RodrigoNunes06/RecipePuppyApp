//
//  RecipiesService.swift
//  RecipePuppyApp
//
//  Created by Rodrigo Nunes on 10/8/19.
//  Copyright © 2019 Rodrigo Nunes Gil. All rights reserved.
//

import Foundation

protocol RecipiesServiceApi {
    func getRecipies(query: String,
                     page: Int,
                     completion: @escaping(Result<[RecipeEntity], Error>) -> Void)
}

final class RecipiesService: RecipiesServiceApi {
    private let router: Router<RecipeEndPoint>
    
    init(router: Router<RecipeEndPoint>) {
        self.router = router
    }
    
    func getRecipies(query: String,
                     page: Int,
                     completion: @escaping(Result<[RecipeEntity], Error>) -> Void) {
        router.request(.searchRecipe(query: query, page: page)) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }
            
            guard let responseData = data else {
                completion(.failure(NetworkResponseError.noData))
                return
            }
            
            do {
                let apiResponse = try JSONDecoder().decode(RecipeApiResponse.self, from: responseData)
                completion(.success(apiResponse.recipies))
            } catch {
                completion(.failure(error))
            }
        }
    }
}
