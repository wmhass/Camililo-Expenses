//
//  HomeWebPageStatementEntityGateway.swift
//  Camililo-IOS
//
//  Created by William Hass on 2019-02-03.
//  Copyright © 2019 lilohass. All rights reserved.
//

import Foundation

class HomeWebPageStatementEntityGateway {
    let filename: String = "statement"
    let fileExtension: String = "txt"
    let defaults: UserDefaults = UserDefaults()
}

// MARK: - HomeEntityGatewayProtocol
extension HomeWebPageStatementEntityGateway: HomeEntityGatewayProtocol {
    
    func fetchExpenses() -> [Expense] {
        guard let url = Bundle.main.url(forResource: self.filename, withExtension: self.fileExtension), let content = try? String(contentsOf: url) else {
            return []
        }
        let lines = content.components(separatedBy: "\n")
        return lines.compactMap({ (line) -> Expense? in

            let rawExpense = line.components(separatedBy: "    ")
            var expense = Expense(fromTXT: rawExpense)
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
