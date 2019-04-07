//
//  CategoriesFilterPresentable.swift
//  Camillilo
//
//  Created by William Hass on 2019-01-12.
//

import Foundation

protocol CategoriesFilterPresentable: class {
    func display(data: CategoryDisplayData, initialSelectedCategories: [ExpenseCategory])
}
