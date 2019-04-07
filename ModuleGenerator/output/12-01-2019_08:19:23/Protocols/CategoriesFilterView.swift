//
//  CategoriesFilterView.swift
//  Camillilo
//
//  Created by William Hass on 2019-01-12.
//

import Foundation

protocol CategoriesFilterView: class {
    var eventHandler: CategoriesFilterViewEventHandler? { get set }
    func set(numberOfCategories: Int)
    func reloadData()
    func reloadItem(atIndexPath indexPath: IndexPath)
    func showSelectionToolBar(_ shouldShow: Bool)
    func showApplyButton(_ shouldShow: Bool)
}
