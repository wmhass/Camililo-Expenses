//
//  HomeEntityGatewayProtocol.swift
//  Camililo-IOS
//
//  Created by William Hass on 2018-12-30.
//  Copyright © 2018 lilohass. All rights reserved.
//

import Foundation

protocol HomeEntityGatewayProtocol {
    func fetchExpenses() -> [Expense]
    func saveExpense(expenseId: String, toCategory expenseCategory: ExpenseCategory)
}
