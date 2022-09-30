//
//  Price.swift
//  CodingTask
//
//  Created by yurii on 30.09.2022.
//

import Foundation

struct Price: Decodable {
    let value: Decimal
    let currency: String
}
