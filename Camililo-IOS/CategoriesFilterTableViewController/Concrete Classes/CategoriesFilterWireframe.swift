//
//  CategoriesFilterWireframe.swift
//  Camillilo
//
//  Created by William Hass on 2019-01-12.
//

import Foundation
import UIKit

class CategoriesFilterWireframe {
    
    weak var viewController: UIViewController?
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
}

// MARK: - CategoriesFilterNavigation
extension CategoriesFilterWireframe: CategoriesFilterNavigation {
    func dismiss() {
        self.viewController?.dismiss(animated: true, completion: nil)
    }
}
