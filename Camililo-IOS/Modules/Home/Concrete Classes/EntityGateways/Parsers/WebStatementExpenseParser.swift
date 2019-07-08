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
            let stringDate = rawExpense.indices.contains(0) ? rawExpense[0] : ""
            let name = rawExpense.indices.contains(1) ? rawExpense[1]
                .trimmingCharacters(in: CharacterSet(charactersIn: "_M"))
                .trimmingCharacters(in: CharacterSet(charactersIn: "_F"))
                .trimmingCharacters(in: CharacterSet.whitespaces) : ""
            let amount: Float = {
                if rawExpense.indices.contains(2) {
                    let txt = rawExpense[2].replacingOccurrences(of: "$", with: "").replacingOccurrences(of: ",", with: "")
                    return Float(txt) ?? 0
                } else {
                    return 0
                }
            }()
            return Expense(name: name,
                           amount: amount,
                           stringDate: stringDate,
                           category: nil)
        }
    }
}
