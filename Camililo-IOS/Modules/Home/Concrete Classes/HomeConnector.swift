//
//  HomeConnector.swift
//  Camililo
//
//  Created by William Hass on 2019-03-02.
//  Copyright © 2019 lilohass. All rights reserved.
//

import Foundation

struct HomeConnector {
    
    func configure(view: HomeViewController) {
//        let parser = CSVExpenseParser()
        let parser = WebStatementExpenseParser()
        let entityGateway = HomeEntityGateway(parser: parser)
        let useCase = HomeUseCase(entityGateway: entityGateway)
        let presenter = HomePresenter(useCase: useCase)

        useCase.presenter = presenter
        presenter.view = view
        view.eventHandler = presenter
    }
    
}
