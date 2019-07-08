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
            
            let stringDate = rawExpense.indices.contains(0) ? rawExpense[0] : ""
            let name = rawExpense.indices.contains(1) ? rawExpense[1]
                .trimmingCharacters(in: CharacterSet(charactersIn: "_M"))
                .trimmingCharacters(in: CharacterSet(charactersIn: "_F"))
                .trimmingCharacters(in: CharacterSet.whitespaces) : ""
            let amount: Float = {
                if rawExpense.indices.contains(2), let floatNum = Float(rawExpense[2]) {
                    return floatNum
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
