//
//  BudgetSetupViewController.swift
//  Camililo-IOS
//
//  Created by William Hass on 2019-04-06.
//  Copyright © 2019 lilohass. All rights reserved.
//

import UIKit

class BudgetSetupViewController: UIViewController {

    var eventHandler: BudgetSetupViewEventHandler?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.eventHandler?.viewDidLoad()
    }
    
    @IBAction func closeButtonTapped() {
        self.eventHandler?.userDidTapCloseButton()
    }
    
}

// MARK: - BudgetSetupView
extension BudgetSetupViewController: BudgetSetupView {
    
}
