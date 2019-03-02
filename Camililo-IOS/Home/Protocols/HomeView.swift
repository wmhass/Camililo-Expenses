//
//  HomeView.swift
//  Camililo-IOS
//
//  Created by William Hass on 2018-12-30.
//  Copyright © 2018 lilohass. All rights reserved.
//

import Foundation

protocol HomeView: class {
    func set(numberOfExpenses: Int)
    func reloadData()
    func reloadCategories()
    func set(numberOfCategories: Int)
    func set(total: String)
    func set(period: String)
    func set(minDate: String)
    func set(maxDate: String)
    func presentDatePicker(title: String, selectedDate: Date?, completion: @escaping(_ newDate: Date?)->Void)
}
