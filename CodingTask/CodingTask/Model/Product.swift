//
//  Product.swift
//  CodingTask
//
//  Created by yurii on 30.09.2022.
//

import Foundation

struct Product: Decodable, Identifiable {
    let name: String
    let type: String
    let id: Int
    let color: String
    let imageURL: String
    let colorCode: String
    let available: Bool
    let releaseDate: Int
    let description: String
    let longDescription: String
    let rating: Float
    let price: Price
}
