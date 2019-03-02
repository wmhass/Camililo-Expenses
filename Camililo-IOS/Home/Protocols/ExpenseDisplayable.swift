//
//  ExpenseDisplayable.swift
//  Camililo-IOS
//
//  Created by William Hass on 2018-12-30.
//  Copyright © 2018 lilohass. All rights reserved.
//

import Foundation

protocol ExpenseDisplayable {
    var dateString: String { get }
    var valueString: String { get }
    var name: String { get }
    var expenseId: String { get }
    var genericExpenseId: String { get }
    var categoryName: String { get }
    var value: Float { get }
    var date: Date? { get }
}
