//
//  ExpenseDisplay.swift
//  Camililo
//
//  Created by William Hass on 2018-12-30.
//  Copyright © 2018 lilohass. All rights reserved.
//

import Foundation

class ExpenseDisplay {
    
    fileprivate let dateFormat = "MM/dd/yyyy"
    fileprivate let expense: Expense
    
    init(expense: Expense) {
        self.expense = expense
    }
}

// MARK: - ExpenseDisplayable
extension ExpenseDisplay: ExpenseDisplayable {
    
    var date: Date? {
        return self.expense.date
    }
    
    var genericExpenseId: String {
        return self.expense.genericId
    }
    
    var dateString: String {
        guard let date = self.expense.date else {
            return ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = self.dateFormat
        return dateFormatter.string(from: date)
    }
    var valueString: String {
        return "$ \(self.expense.amount)"
    }
    var name: String {
        return self.expense.name
    }
    var expenseId: String {
        return self.expense.id
    }
    var categoryName: String {
        return self.expense.category?.rawValue ?? ""
    }
    var value: Float {
        return self.expense.amount
    }
}
