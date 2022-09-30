//
//  UserDefaultsManager.swift
//  CodingTask
//
//  Created by yurii on 30.09.2022.
//

import Foundation

final class UserDefaultsManager {
    private static let symbolKey = "SYMBOL_KEY"
    var savedSymbols: [Int] = []
    static let shared = UserDefaultsManager()
    
    private init() {
        get()
    }
    
    func get() {
        if let saved = UserDefaults.standard.array(forKey: Self.symbolKey) as? [Int] {
            savedSymbols = saved
        }
    }
    
    func set(symbol: Int) {
        savedSymbols.append(symbol)
        UserDefaults.standard.set(self.savedSymbols, forKey: Self.symbolKey)
    }
}
