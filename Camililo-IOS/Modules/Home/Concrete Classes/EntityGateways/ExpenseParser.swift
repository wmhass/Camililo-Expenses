//
//  ExpenseParser.swift
//  Camililo
//
//  Created by William Hass on 2019-03-02.
//  Copyright © 2019 lilohass. All rights reserved.
//

import Foundation

protocol ExpenseParser {
    var filename: String { get }
    var fileExtension: String { get }
    var parse: (String) -> Expense? { get }
}
