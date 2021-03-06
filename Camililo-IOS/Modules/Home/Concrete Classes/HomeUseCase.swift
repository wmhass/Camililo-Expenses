//
//  HomeUseCase.swift
//  Camililo-IOS
//
//  Created by William Hass on 2018-12-30.
//  Copyright © 2018 lilohass. All rights reserved.
//

import Foundation

class HomeUseCase {
    weak var presenter: HomePresentation?
    let entityGateway: HomeEntityGatewayProtocol
    fileprivate(set) var categoriesFilter: [ExpenseCategory] = []
    
    init(entityGateway: HomeEntityGatewayProtocol) {
        self.entityGateway = entityGateway
    }
    
}

// MARK: - HomeUseCaseProtocol
extension HomeUseCase: HomeUseCaseProtocol {
    
    func filter(categories: [ExpenseCategory]) {
        self.categoriesFilter = categories
    }
    
    func showContent(startDate: Date?, endDate: Date?) {
        let ignoringCategories: [ExpenseCategory] = []
        
        let filteringCategories = self.categoriesFilter.count > 0
        let filteringDate = startDate != nil && endDate != nil
        
        let expenses = self.entityGateway.fetchExpenses().filter { (expense) -> Bool in
            guard let category = expense.category else {
                return true
            }
            if filteringCategories {
                return self.categoriesFilter.contains(category) && !ignoringCategories.contains(category)
            } else {
                return !ignoringCategories.contains(category)
            }
            }.filter { (expense) -> Bool in
                guard filteringDate, let date = expense.date, let startDate = startDate, let endDate = endDate else {
                    return true
                }
                return (startDate...endDate).contains(date)
        }

        let displayableExpenses = expenses.compactMap({ (expense) -> ExpenseDisplay? in
            if self.categoriesFilter.count > 0 && expense.category == nil {
                return nil
            }
            return ExpenseDisplay(expense: expense)
        })
        
        self.presenter?.present(displayableExpenses: displayableExpenses)
    }
    
    func set(expenseCategory: ExpenseCategory, toExpenseWithId expense: String) {
        self.entityGateway.saveExpense(expenseId: expense, toCategory: expenseCategory)
    }
}
