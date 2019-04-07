//
//  CategoriesFilterEntityGatewayProtocol.swift
//  Camillilo
//
//  Created by William Hass on 2019-01-12.
//

import Foundation

protocol CategoriesFilterEntityGatewayProtocol {
    func loadCategories() -> [ExpenseCategory]
}
