//
//  Favorites.swift
//  IdillikaDIIT
//
//  Created by arsik on 07.10.2020.
//  Copyright © 2020 arsik. All rights reserved.
//

import Foundation

final class Favorites {
    
    static let shared = Favorites()
    
    private let key = "diit.test_project.idillika"
    private var favorites: [Int] = []
    
    
    // MARK: - Init
    private init() {
        guard
            let data = UserDefaults.standard.data(forKey: key),
            let favorites = try? JSONDecoder().decode([Int].self, from: data) else { return }
        
        self.favorites = favorites
    }
    
    
    // MARK: - Public methods
    func checkForFavorites(id: Int) -> Bool {
        
        if let _ = favorites.first(where: { $0 == id } ) {
            return true
        } else { return false }
    }
    
    func favoriteClick(id: Int) -> Bool {
        
        if let index = favorites.firstIndex(where: { $0 == id } ) {
            favorites.remove(at: index)
            synchronize()
            return false
        } else {
            favorites.append(id)
            synchronize()
            return true
        }
    }
    
    
    // MARK: - Private methods
    private func synchronize() {
        
        guard let addresses = try? JSONEncoder().encode(favorites) else { return }
        UserDefaults.standard.set(addresses, forKey: key)
    }
}
