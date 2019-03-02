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
    fileprivate let dateFormatter: DateFormatter
    var date: Date? {
        return self.dateFormatter.date(from: self.stringDate)
    }
    var id: String {
        return "\(self.name)_\(self.stringDate)_\(String(self.amount))"
    }
    var genericId: String {
        return "\(self.name)"
    }
}

extension Expense {
    init(fromTXT: [String]) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        self.dateFormatter = dateFormatter
        
        self.stringDate = fromTXT.indices.contains(0) ? fromTXT[0] : ""
        self.name = fromTXT.indices.contains(1) ? fromTXT[1]
            .trimmingCharacters(in: CharacterSet(charactersIn: "_M"))
            .trimmingCharacters(in: CharacterSet(charactersIn: "_F"))
            .trimmingCharacters(in: CharacterSet.whitespaces) : ""
        self.amount = {
            if fromTXT.indices.contains(2) {
                let txt = fromTXT[2].replacingOccurrences(of: "$", with: "").replacingOccurrences(of: ",", with: "")
                return Float(txt) ?? 0
            } else {
                return 0
            }
        }()
        
    }
}

extension Expense {
    init(fromCSV: [String]) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        self.dateFormatter = dateFormatter
        self.stringDate = fromCSV.indices.contains(0) ? fromCSV[0] : ""
        self.name = fromCSV.indices.contains(1) ? fromCSV[1]
            .trimmingCharacters(in: CharacterSet(charactersIn: "_M"))
            .trimmingCharacters(in: CharacterSet(charactersIn: "_F"))
            .trimmingCharacters(in: CharacterSet.whitespaces) : ""
        self.amount = {
            if fromCSV.indices.contains(2), let floatNum = Float(fromCSV[2]) {
                return floatNum
            } else {
                return 0
            }
        }()
        
    }
}
