//
//  RecipesService.swift
//  RecipePuppyApp
//
//  Created by Rodrigo Nunes on 10/8/19.
//  Copyright © 2019 Rodrigo Nunes Gil. All rights reserved.
//

import Foundation

typealias ServiceResult = (Result<[RecipeEntity], Error>) -> ()

//sourcery: AutoMockable
protocol RecipesServiceInterface {
    func getRecipes(query: String,
                     page: Int,
                     completion: @escaping ServiceResult)
}

final class RecipesService: RecipesServiceInterface {
    private let router: Router<RecipeEndPoint>
    static let shared = RecipesService()
    
    init() {
        self.router = Router<RecipeEndPoint>(requestBuilder: NetworkRequestBuilder())
    }
    
    func getRecipes(query: String,
                     page: Int,
                     completion: @escaping ServiceResult) {
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
                DispatchQueue.main.async {
                    completion(.success(apiResponse.recipies))
                }
            } catch {
                completion(.failure(error))
            }
        }
    }
}
