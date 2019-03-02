//
//  CategoriesFilterSingleSelectionNavigationSegue.swift
//  Camililo-IOS
//
//  Created by William Hass on 2019-03-02.
//  Copyright © 2019 lilohass. All rights reserved.
//

import Foundation

import UIKit

class CategoriesFilterSingleSelectionNavigationSegue: UIStoryboardSegue {
    
    static var identifier: String = "CategoriesFilterSingleSelectionNavigationSegue"
    var selectedCategories: [ExpenseCategory] = []
    
    override func perform() {
        super.perform()
        if let nav = self.destination as? UINavigationController,
            let categoriesFilterView = nav.viewControllers.first as? CategoriesFilterTableViewController {
            
            let connector = CategoriesFilterConnector()
            connector.configureSingleSelection(view: categoriesFilterView, delegate: self.source as? CategoriesSingleSelectionPresenterDelegate, initialSelectedCategories: self.selectedCategories)
        }
    }
    
}
