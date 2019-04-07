//
//  CSVExpenseParser.swift
//  Camililo
//
//  Created by William Hass on 2019-03-02.
//  Copyright © 2019 lilohass. All rights reserved.
//

import Foundation

struct CSVExpenseParser {
    
}

// MARK: - ExpenseParser
extension CSVExpenseParser: ExpenseParser {
    var filename: String {
        return "accountactivity"
    }
    var fileExtension: String {
        return "csv"
    }
    var parse: (String) -> Expense? {
        return { line in
            let rawExpense = line.components(separatedBy: ",")
            return Expense(fromCSV: rawExpense)
        }
    }
}
