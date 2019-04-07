//
//  HomeUseCaseProtocol.swift
//  Camililo-IOS
//
//  Created by William Hass on 2018-12-30.
//  Copyright © 2018 lilohass. All rights reserved.
//

import Foundation

protocol HomeUseCaseProtocol {
    var categoriesFilter: [ExpenseCategory] { get }
    func showContent(startDate: Date?, endDate: Date?)
    func set(expenseCategory: ExpenseCategory, toExpenseWithId expense: String)
    func filter(categories: [ExpenseCategory])
}
