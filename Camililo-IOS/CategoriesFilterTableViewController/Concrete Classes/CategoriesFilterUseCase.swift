//
//  CategoriesFilterUseCase.swift
//  Camillilo
//
//  Created by William Hass on 2019-01-12.
//

import Foundation

class CategoriesFilterUseCase {
    
    weak var presenter: CategoriesFilterPresentable?
    let entityGateway: CategoriesFilterEntityGatewayProtocol
    var initialSelectedCategories: [ExpenseCategory] = []
    
    init(entityGateway: CategoriesFilterEntityGatewayProtocol) {
        self.entityGateway = entityGateway
    }
    
}

// MARK: - CategoriesFilterUseCaseProtocol
extension CategoriesFilterUseCase: CategoriesFilterUseCaseProtocol {
    
    func presentContent() {
        let categories = self.entityGateway.loadCategories()
        
        self.presenter?.display(data: CategoryDisplayData(categories: categories), initialSelectedCategories: self.initialSelectedCategories)
    }
    
}
