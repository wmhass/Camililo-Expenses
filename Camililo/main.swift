//
//  main.swift
//  Camililo
//
//  Created by William Hass on 2018-12-23.
//  Copyright © 2018 lilohass. All rights reserved.
//

import Foundation

print("Bundle: \(Bundle.main)")

var url = Bundle.main.bundleURL
url.appendPathComponent("Resources")
print(url)

let fileManager = FileManager.default
let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
do {
    let fileURLs = try fileManager.contentsOfDirectory(at: documentsURL, includingPropertiesForKeys: nil)
    print("FileURLS: \(fileURLs)")
    // process files
} catch {
    print("Error while enumerating files \(documentsURL.path): \(error.localizedDescription)")
}

let weeks: [String: [ExpenseCategory: [Expense]]] = [
    "January 16 to 22": [
        .cellPhone: [
            Expense(name: "Freedom mobile", amount: 56.0),
            Expense(name: "Freedom mobile", amount: 56.0)
        ],
        
        .transportation: [
            Expense(name: "Compass", amount: 20.0)
        ],
        
        .cannabis: [
            Expense(name: "WestCanna", amount: 18.00),
            Expense(name: "WestCanna", amount: 17.96)
        ],
        
        .groceries: [
            Expense(name: "MACS Convenience store", amount: 5.59),
            Expense(name: "Vegan supply", amount: 44.20),
            Expense(name: "Dollarama", amount: 4.0),
            Expense(name: "No frills", amount: 9.02),
            Expense(name: "Independent", amount: 8.99),
            Expense(name: "No frills", amount: 50.65),
            Expense(name: "Vegan Cookies", amount: 18.90),
            Expense(name: "Granola bar", amount: 1.0),
            Expense(name: "Granola bar", amount: 1.0),
            Expense(name: "Independent", amount: 9.44),
            Expense(name: "Kins Dav", amount: 3.78),
            Expense(name: "No frills", amount: 32.50),
            Expense(name: "Vending machine redbull", amount: 3.0),
            Expense(name: "7 eleven", amount: 3.2)
        ],
        
        .outsideEat: [
            Expense(name: "Meet in gastown", amount: 48.63),
            Expense(name: "Tim Hortons", amount: 2.3),
            Expense(name: "A&W", amount: 21.79),
            Expense(name: "Subway", amount: 4.71),
        ],
        
        ._420bits: [
            Expense(name: "Lees electronic", amount: 17.81),
            Expense(name: "Dollar store (Wire)", amount: 4.57)
        ],
        
        .shopping:[
            Expense(name: "Camilla's Christmas Gift", amount: 20.0),
            Expense(name: "Amazon William", amount: 60.53)
        ],
        
        .utilities: [
            Expense(name: "Dollarama", amount: 4.48),
        ],
        
        .gym: [
            Expense(name: "Dollarama", amount: 60.0),
        ],
        
        .withdraw: [
            Expense(name: "Withdraw", amount: 60.0),
        ],
        .shipping: [
            Expense(name: "Send letter to Brazil", amount: 9.25),
        ],
    ]
]

for weekCategories in weeks {
    let week = weekCategories.key
    let categories = weekCategories.value
    
    let weekTotal = categories.reduce(0.0) { (result, categoryExpenses) -> Float in
        return result + categoryExpenses.value.reduce(0.0) { (categoryResult, expense) -> Float in
            return categoryResult + expense.amount
        }
    }
    
    print("Week: \(week)")
    print("Week total: \(weekTotal) | Per person: \(weekTotal/2)")
    
    for categoryExpenses in categories {
        let category = categoryExpenses.key
        let expenses = categoryExpenses.value
        
        print("  Category: \(category.rawValue)")
        for expense in expenses {
            print("       \(expense.amount): \(expense.name)")
        }
    }
    
}

let grandTotal = weeks.reduce(0.0) { (totalResult, weekExpenses)-> Float in
    let totalWeek = weekExpenses.value.reduce(0) { (weekResult, categoryExpenses) -> Float in
        let total = categoryExpenses.value.reduce(0) { (accumulated, expense) -> Float in
            return expense.amount + accumulated
        }
        return weekResult + total
    }
    return totalResult + totalWeek
}

print("")
print("")
print("")
print("Grand total: \(grandTotal) | Per person: \(grandTotal/2)")
