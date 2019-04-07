//
//  CategoriesFilterEntityGateway.swift
//  Camillilo
//
//  Created by William Hass on 2019-01-12.
//

import Foundation

class CategoriesFilterEntityGateway {
    
}

// MARK: - CategoriesFilterEntityGatewayProtocol
extension CategoriesFilterEntityGateway: CategoriesFilterEntityGatewayProtocol {
    func loadCategories() -> [ExpenseCategory] {
        return ExpenseCategory.allCases.sorted(by: { $0.rawValue < $1.rawValue })
    }
}
