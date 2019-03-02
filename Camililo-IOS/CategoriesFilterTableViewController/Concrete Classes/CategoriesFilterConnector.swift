//
//  CategoriesFilterConnector.swift
//  Camillilo
//
//  Created by William Hass on 2019-01-12.
//

import Foundation

class CategoriesFilterConnector {
    
    func configureSingleSelection(view: CategoriesFilterTableViewController,
                                  delegate: CategoriesSingleSelectionPresenterDelegate?,
                                  initialSelectedCategories: [ExpenseCategory]) {
        let navigation = CategoriesFilterWireframe(viewController: view)
        let entityGateway = CategoriesFilterEntityGateway()
        let useCase = CategoriesFilterUseCase(entityGateway: entityGateway)
        let presenter = CategoriesFilterPresenter(useCase: useCase,
                                                  navigation: navigation,
                                                  multiSelection: false)
        
        useCase.initialSelectedCategories = initialSelectedCategories
        presenter.singleSelectionDelegate = delegate
        useCase.presenter = presenter
        presenter.view = view
        view.eventHandler = presenter
    }
    
    func configureMultiSelection(view: CategoriesFilterTableViewController,
                                 delegate: CategoriesFilterPresenterDelegate?,
                                 initialSelectedCategories: [ExpenseCategory]) {
        let navigation = CategoriesFilterWireframe(viewController: view)
        let entityGateway = CategoriesFilterEntityGateway()
        let useCase = CategoriesFilterUseCase(entityGateway: entityGateway)
        let presenter = CategoriesFilterPresenter(useCase: useCase,
                                                  navigation: navigation,
                                                  multiSelection: true)
        
        useCase.initialSelectedCategories = initialSelectedCategories
        presenter.multiSelectionDelegate = delegate
        useCase.presenter = presenter
        presenter.view = view
        view.eventHandler = presenter
    }
    
}
