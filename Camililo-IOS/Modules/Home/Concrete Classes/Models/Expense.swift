//
//  Expense.swift
//  Camililo
//
//  Created by William Hass on 2018-12-23.
//  Copyright © 2018 lilohass. All rights reserved.
//

import Foundation

struct Expense {
    let name: String
    let amount: Float
    let stringDate: String
    var category: ExpenseCategory?
    static var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter
    }()
    var date: Date? {
        return Expense.dateFormatter.date(from: self.stringDate)
    }
    var id: String {
        return "\(self.name)_\(self.stringDate)_\(String(self.amount))"
    }
    var genericId: String {
        return "\(self.name)"
    }
}
