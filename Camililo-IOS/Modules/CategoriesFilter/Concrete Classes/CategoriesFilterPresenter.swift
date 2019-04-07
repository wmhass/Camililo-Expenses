//
//  CategoriesFilterPresenter.swift
//  Camillilo
//
//  Created by William Hass on 2019-01-12.
//

import Foundation

protocol CategoriesSingleSelectionPresenterDelegate: class {
    func selected(category: ExpenseCategory)
}

protocol CategoriesFilterPresenterDelegate: class {
    func filter(categories: [ExpenseCategory])
}

class CategoriesFilterPresenter {
    
    weak var view: CategoriesFilterView?
    let useCase: CategoriesFilterUseCaseProtocol
    let navigation: CategoriesFilterNavigation
    var data: CategoryDisplayData = CategoryDisplayData(categories: [])
    var selectedIndices: [Int] = []
    weak var multiSelectionDelegate: CategoriesFilterPresenterDelegate?
    weak var singleSelectionDelegate: CategoriesSingleSelectionPresenterDelegate?
    let multiSelection: Bool
    
    init(useCase: CategoriesFilterUseCaseProtocol,
         navigation: CategoriesFilterNavigation,
         multiSelection: Bool) {
        self.useCase = useCase
        self.navigation = navigation
        self.multiSelection = multiSelection
    }
    
}

// MARK: - CategoriesFilterPresentable
extension CategoriesFilterPresenter: CategoriesFilterPresentable {
    func display(data: CategoryDisplayData, initialSelectedCategories: [ExpenseCategory]) {
        self.data = data
        self.selectedIndices = data.indices(ofCategories: initialSelectedCategories)
        self.view?.set(numberOfCategories: data.numberOfCategories)
        self.view?.reloadData()
    }
    
    func display(data: CategoryDisplayData) {
        
    }
}

// MARK: - CategoriesFilterViewEventHandler
extension CategoriesFilterPresenter: CategoriesFilterViewEventHandler {

    func didSelectItem(atIndexPath indexPath: IndexPath) {
        if !self.selectedIndices.contains(indexPath.item) {
            self.selectedIndices.append(indexPath.item)
        } else if let index = self.selectedIndices.index(of: indexPath.item) {
            self.selectedIndices.remove(at: index)
        }
        if self.multiSelection {
            self.view?.reloadItem(atIndexPath: indexPath)
        } else {
            self.navigation.dismiss()
            self.singleSelectionDelegate?.selected(category: self.data.category(atIndex: indexPath.item))
        }
    }
    
    func viewDidLoad() {
        self.useCase.presentContent()
        self.view?.showApplyButton(self.multiSelection)
        self.view?.showSelectionToolBar(self.multiSelection)
    }
    
    func dismissButtonTapped() {
        self.navigation.dismiss()
    }
    
    func applyButtonTouched() {
        self.multiSelectionDelegate?.filter(categories: self.data.categories(atIndices: self.selectedIndices))
        self.navigation.dismiss()
    }
    
    func clearButtonTouched() {
        self.selectedIndices.removeAll()
        self.view?.reloadData()
    }
    
    func selectAllButtonTouched() {
        self.selectedIndices = self.data.allIndices
        self.view?.reloadData()
    }
    
    func configure(cell: CategoryItemView, indexPath: IndexPath) {
        let category = self.data.category(atIndex: indexPath.item)
        cell.set(title: category.rawValue)
        cell.set(selected: self.selectedIndices.contains(indexPath.item))
    }
}
