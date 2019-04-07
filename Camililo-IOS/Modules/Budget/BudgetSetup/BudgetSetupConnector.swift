//
//  BudgetSetupConnector.swift
//  Camililo-iOS
//
//  Created by William Hass on 2019-04-06.
//

import Foundation

class BudgetSetupConnector {
    
    func configure(view: BudgetSetupViewController) {
        let navigation = BudgetSetupWireframe(viewController: view)
        let entityGateway = BudgetSetupEntityGateway()
        let useCase = BudgetSetupUseCase(entityGateway: entityGateway)
        let presenter = BudgetSetupPresenter(useCase: useCase, navigation: navigation)
        
        useCase.presenter = presenter
        presenter.view = view
        view.eventHandler = presenter
    }
    
}
