//
//  HomeEntityGateway.swift
//  Camililo-IOS
//
//  Created by William Hass on 2018-12-30.
//  Copyright © 2018 lilohass. All rights reserved.
//

import Foundation

class HomeEntityGateway {
    let defaults: UserDefaults = UserDefaults()
    
    let parser: ExpenseParser
    init(parser: ExpenseParser) {
        self.parser = parser
    }
}

// MARK: - HomeEntityGatewayProtocol
extension HomeEntityGateway: HomeEntityGatewayProtocol {
    
    func fetchExpenses() -> [Expense] {
        guard let url = Bundle.main.url(forResource: self.parser.filename, withExtension: self.parser.fileExtension), let content = try? String(contentsOf: url) else {
            return []
        }
        let lines = content.components(separatedBy: "\n")
        return lines.compactMap({ (line) -> Expense? in
            guard var expense = self.parser.parse(line) else {
                return nil
            }
            if let rawCategory = self.defaults.string(forKey: expense.id) {
                expense.category = ExpenseCategory(rawValue: rawCategory)
            } else if let rawGenericCategory = self.defaults.string(forKey: expense.genericId) {
                expense.category = ExpenseCategory(rawValue: rawGenericCategory)
            }
            
            if expense.amount == 0 {
                return nil
            }
            return expense

        }).sorted(by: { (e1, e2) -> Bool in
            guard let e1Date = e1.date, let e2Date = e2.date else {
                return true
            }
            return e1Date > e2Date
        })
    }
    
    func saveExpense(expenseId: String, toCategory expenseCategory: ExpenseCategory) {
        self.defaults.set(expenseCategory.rawValue, forKey: expenseId)
        self.defaults.synchronize()
    }
}
