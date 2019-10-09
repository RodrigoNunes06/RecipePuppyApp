//
//  DataMapperProtocol.swift
//  RecipePuppyApp
//
//  Created by Rodrigo Nunes on 10/8/19.
//  Copyright © 2019 Rodrigo Nunes Gil. All rights reserved.
//

import Foundation

protocol DataMapper {
    associatedtype Entity: Any
    associatedtype Domain: Any
    func transform(entity: Entity) -> Domain 
}
