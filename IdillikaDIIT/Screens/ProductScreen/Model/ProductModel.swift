//
//  ProductModel.swift
//  IdillikaDIIT
//
//  Created by arsik on 23.09.2020.
//  Copyright © 2020 arsik. All rights reserved.
//

import Foundation

struct ProductModel: Codable {
    let id: Int
    let imageLink: String
    var title: String
    let price: Int
    let available: Bool
    let favorite: Bool
    let brand: String
}

