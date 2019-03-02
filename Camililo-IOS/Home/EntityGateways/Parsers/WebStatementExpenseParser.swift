//
//  WebStatementExpenseParser.swift
//  Camililo
//
//  Created by William Hass on 2019-03-02.
//  Copyright © 2019 lilohass. All rights reserved.
//

import Foundation

struct WebStatementExpenseParser {
    
}

// MARK: - ExpenseParser
extension WebStatementExpenseParser: ExpenseParser {
    var filename: String {
        return "web_statement"
    }
    var fileExtension: String {
        return "txt"
    }
    var parse: (String) -> Expense? {
        return { line in
            let rawExpense = line.components(separatedBy: "    ")
            return Expense(fromTXT: rawExpense)
        }
    }
}
