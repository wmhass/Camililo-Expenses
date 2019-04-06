//
//  BudgetSetupWireframe.swift
//  Camililo-iOS
//
//  Created by William Hass on 2019-04-06.
//

import UIKit

class BudgetSetupWireframe {
    
    weak var viewController: BudgetSetupViewController?
    var navigationController: UINavigationController? {
        return self.viewController?.navigationController
    }
    
    init(viewController: BudgetSetupViewController) {
        self.viewController = viewController
    }
    
    func launch() {
        
    }
    
}

// MARK: - BudgetSetupNavigation
extension BudgetSetupWireframe: BudgetSetupNavigation {
    func dismissView() {
        self.viewController?.dismiss(animated: true, completion: nil)
    }
}
