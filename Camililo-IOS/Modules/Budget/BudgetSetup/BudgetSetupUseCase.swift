//
//  BudgetSetupUseCase.swift
//  Camililo-iOS
//
//  Created by William Hass on 2019-04-06.
//

import Foundation

class BudgetSetupUseCase {
    
    weak var presenter: BudgetSetupPresentable?
    let entityGateway: BudgetSetupEntityGatewayProtocol
    
    init(entityGateway: BudgetSetupEntityGatewayProtocol) {
        self.entityGateway = entityGateway
    }
    
}

// MARK: - BudgetSetupUseCaseProtocol
extension BudgetSetupUseCase: BudgetSetupUseCaseProtocol {
    
}
