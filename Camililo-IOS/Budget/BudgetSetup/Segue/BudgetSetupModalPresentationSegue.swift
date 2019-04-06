//
//  BudgetSetupModalPresentationSegue.swift
//  Camililo-IOS
//
//  Created by William Hass on 2019-04-06.
//  Copyright © 2019 lilohass. All rights reserved.
//

import UIKit

class BudgetSetupModalPresentationSegue: UIStoryboardSegue {
    override func perform() {
        super.perform()
        if let nav = self.destination as? UINavigationController,
            let budgetSetupView = nav.viewControllers.first as? BudgetSetupViewController {
            
            let connector = BudgetSetupConnector()
            connector.configure(view: budgetSetupView)
            
//            let connector = CategoriesFilterConnector()
//            connector.configureMultiSelection(view: categoriesFilterView, delegate: self.source as? CategoriesFilterPresenterDelegate, initialSelectedCategories: self.selectedCategories)
        }
    }
}
