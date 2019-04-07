//
//  BudgetSetupPresenter.swift
//  Camililo-iOS
//
//  Created by William Hass on 2019-04-06.
//

import Foundation

class BudgetSetupPresenter {
    
    weak var view: BudgetSetupView?
    let useCase: BudgetSetupUseCaseProtocol
    let navigation: BudgetSetupNavigation
    
    init(useCase: BudgetSetupUseCaseProtocol, navigation: BudgetSetupNavigation) {
        self.useCase = useCase
        self.navigation = navigation
    }
    
}

// MARK: - BudgetSetupPresentable
extension BudgetSetupPresenter: BudgetSetupPresentable {

}

// MARK: - BudgetSetupViewEventHandler
extension BudgetSetupPresenter: BudgetSetupViewEventHandler {
    func viewDidLoad() {
        
    }
    func userDidTapCloseButton() {
        self.navigation.dismissView()
    }
}
