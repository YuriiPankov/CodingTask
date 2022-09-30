//
//  API.swift
//  CodingTask
//
//  Created by yurii on 30.09.2022.
//

import Foundation

struct API {
    static var components = URLComponents(string: "http://app.check24.de/products-test.json")!
    static var url = components.url
}
