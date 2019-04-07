//
//  ExpenseCellProtocol.swift
//  Camililo-IOS
//
//  Created by William Hass on 2018-12-30.
//  Copyright © 2018 lilohass. All rights reserved.
//

import Foundation

protocol ExpenseCellProtocol {
    func set(date: String)
    func set(name: String)
    func set(value: String)
    func set(categoryName: String)
}
