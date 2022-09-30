//
//  ProductsInfo.swift
//  CodingTask
//
//  Created by yurii on 30.09.2022.
//

import Foundation

struct ProductsInfo: Decodable {
    let header: Header
    let products: [Product]
}
