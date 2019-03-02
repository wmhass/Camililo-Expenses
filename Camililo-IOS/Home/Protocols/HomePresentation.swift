//
//  HomePresentation.swift
//  Camililo-IOS
//
//  Created by William Hass on 2018-12-30.
//  Copyright © 2018 lilohass. All rights reserved.
//

import Foundation

protocol HomePresentation: class {
    func present(displayableExpenses: [ExpenseDisplayable])
}
