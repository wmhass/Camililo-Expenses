//
//  HomeViewEventHandler.swift
//  Camililo-IOS
//
//  Created by William Hass on 2018-12-30.
//  Copyright © 2018 lilohass. All rights reserved.
//

import Foundation

protocol HomeViewToCategoriesFilterTransition {
    func set(selectedCategories: [ExpenseCategory])
}

protocol HomeViewEventHandler {
    func viewDidLoad()
    func configure(cell: ExpenseCellProtocol, atIndexPath indexPath: IndexPath)
    func filter(categories: [ExpenseCategory])
    func prepare(transition: HomeViewToCategoriesFilterTransition)
    func fromDateButtonTapped()
    func toDateButtonTapped()
    func setThis(category: ExpenseCategory, toExpenseAtIndex expenseIndex: IndexPath)
    func setAlways(category: ExpenseCategory, toExpenseAtIndex expenseIndex: IndexPath)
}
