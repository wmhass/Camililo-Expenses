//
//  BudgetSetupView.swift
//  Camililo-iOS
//
//  Created by William Hass on 2019-04-06.
//

import Foundation

protocol BudgetSetupView: class {
    var eventHandler: BudgetSetupViewEventHandler? { get set }
}
