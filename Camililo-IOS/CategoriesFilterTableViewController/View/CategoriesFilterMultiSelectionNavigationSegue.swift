//
//  CategoriesFilterMultiSelectionNavigationSegue.swift
//  Camililo-IOS
//
//  Created by William Hass on 2019-01-12.
//  Copyright © 2019 lilohass. All rights reserved.
//

import UIKit

class CategoriesFilterMultiSelectionNavigationSegue: UIStoryboardSegue {

    var selectedCategories: [ExpenseCategory] = []
    
    override func perform() {
        super.perform()
        if let nav = self.destination as? UINavigationController,
            let categoriesFilterView = nav.viewControllers.first as? CategoriesFilterTableViewController {
            
            let connector = CategoriesFilterConnector()
            connector.configureMultiSelection(view: categoriesFilterView, delegate: self.source as? CategoriesFilterPresenterDelegate, initialSelectedCategories: self.selectedCategories)
        }
    }
    
}

// MARK: - HomeViewToCategoriesFilterTransition
extension CategoriesFilterMultiSelectionNavigationSegue: HomeViewToCategoriesFilterTransition {
    func set(selectedCategories: [ExpenseCategory]) {
        self.selectedCategories = selectedCategories
    }
}
