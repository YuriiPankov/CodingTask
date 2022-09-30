//
//  Format.swift
//  CodingTask
//
//  Created by yurii on 30.09.2022.
//

import Foundation

struct Format {
    //date formatter instance is created for every decoded model each time. date formatter initialization is heavy operation. better to use the same once initialized. e.g static
    static let shortDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "d.M.yyyy"
        return formatter
    }()
}
