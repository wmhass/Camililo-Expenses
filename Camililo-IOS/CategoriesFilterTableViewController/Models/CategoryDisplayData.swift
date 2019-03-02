//
//  CategoryDisplayData.swift
//  Camililo
//
//  Created by William Hass on 2019-01-12.
//  Copyright © 2019 lilohass. All rights reserved.
//

import Foundation

struct CategoryDisplayData {
    
    fileprivate var categories: [ExpenseCategory]
    
    var allIndices: [Int] {
        return self.categories.indices.compactMap({ return $0 })
    }
    
    var numberOfCategories: Int {
        return self.categories.count
    }
    
    init(categories: [ExpenseCategory]) {
        self.categories = categories
    }
    
    func category(atIndex index: Int) -> ExpenseCategory {
        return self.categories[index]
    }
    
    func categories(atIndices indices: [Int]) -> [ExpenseCategory] {
        return indices.compactMap({ return self.categories[$0] })
    }
    
    func indices(ofCategories categories: [ExpenseCategory]) -> [Int] {
        return self.categories.enumerated().compactMap({ (offsetElement) -> Int? in
            if categories.contains(where: { (category) -> Bool in
                return category == offsetElement.element
            }) {
                return offsetElement.offset
            } else {
                return nil
            }
        })
    }
}
