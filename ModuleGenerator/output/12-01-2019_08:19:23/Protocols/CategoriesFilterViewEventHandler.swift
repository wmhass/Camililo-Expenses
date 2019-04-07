//
//  CategoriesFilterViewEventHandler.swift
//  Camillilo
//
//  Created by William Hass on 2019-01-12.
//

import Foundation

protocol CategoryItemView {
    func set(title: String)
    func set(selected: Bool)
}

protocol CategoriesFilterViewEventHandler {
    func viewDidLoad()
    func dismissButtonTapped()
    func applyButtonTouched()
    func configure(cell: CategoryItemView, indexPath: IndexPath)
    func didSelectItem(atIndexPath indexPath: IndexPath)
    func clearButtonTouched()
    func selectAllButtonTouched()
}
