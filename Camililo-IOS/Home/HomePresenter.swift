//
//  HomePresenter.swift
//  Camililo-IOS
//
//  Created by William Hass on 2018-12-30.
//  Copyright © 2018 lilohass. All rights reserved.
//

import Foundation


class HomePresenter {
    
    var displayableExpenses: [ExpenseDisplayable] = []
    let useCase: HomeUseCaseProtocol
    weak var view: HomeView?
    var fromDate: Date?
    var toDate: Date?
    lazy var dateFormatter: DateFormatter = {
        var formatter = DateFormatter()
        formatter.dateFormat = "E, d MMM yyyy"
        return formatter
    }()
    
    init(useCase: HomeUseCaseProtocol) {
        self.useCase = useCase
    }
    
}

// MARK: - HomePresentation
extension HomePresenter: HomePresentation {
    
    func present(displayableExpenses: [ExpenseDisplayable]) {
        self.displayableExpenses = displayableExpenses
        
        let total = displayableExpenses.reduce(0.0) { (totalResult, expense) -> Float in
            return totalResult + expense.value
        }
        
        if self.fromDate == nil {
            self.fromDate = displayableExpenses.last?.date
        }
        if self.toDate == nil {
            self.toDate = displayableExpenses.first?.date
        }
        
        if let fromDate = self.fromDate {
            self.view?.set(minDate: self.dateFormatter.string(from: fromDate))
        }
        if let toDate = self.toDate {
            self.view?.set(maxDate: self.dateFormatter.string(from: toDate))
        }

        if let fromDate = self.fromDate, let toDate = self.toDate {
            let numberOfDays = toDate.timeIntervalSince1970 - fromDate.timeIntervalSince1970
            let days = Int((numberOfDays/((60 * 60)*24)).rounded())
            let average = Int((total/Float(days)).rounded())
            self.view?.set(period: "(\(days) days - avg. $\(average)/day)")
        } else {
            self.view?.set(period: "")
        }
        
        self.view?.set(total: "$ \(String(format: "%.2f", total))")
        self.view?.reloadCategories()
        self.view?.set(numberOfExpenses: self.displayableExpenses.count)
        self.view?.reloadData()
    }
    
}

// MARK: - HomeViewEventHandler
extension HomePresenter: HomeViewEventHandler {
    
    func fromDateButtonTapped() {
        self.view?.presentDatePicker(title: "From date", selectedDate: self.fromDate) { newDate in
            self.fromDate = newDate
            self.reloadContent()
        }
    }
    
    func toDateButtonTapped() {
        self.view?.presentDatePicker(title: "To date", selectedDate: self.toDate) { newDate in
            self.toDate = newDate
            self.reloadContent()
        }
    }
    
    func viewDidLoad() {
        self.reloadContent()
    }
    
    func reloadContent() {
        self.useCase.showContent(startDate: self.fromDate, endDate: self.toDate)
    }
    
    func configure(cell: ExpenseCellProtocol, atIndexPath indexPath: IndexPath) {
        guard self.displayableExpenses.indices.contains(indexPath.item) else {
            return
        }
        let expense = self.displayableExpenses[indexPath.item]
        cell.set(date: expense.dateString)
        cell.set(name: expense.name)
        cell.set(value: expense.valueString)
        cell.set(categoryName: expense.categoryName)
    }
    
    func filter(categories: [ExpenseCategory]) {
        self.useCase.filter(categories: categories)
        self.reloadContent()
    }
    
    func prepare(transition: HomeViewToCategoriesFilterTransition) {
        transition.set(selectedCategories: self.useCase.categoriesFilter)
    }
    
    func setThis(category: ExpenseCategory, toExpenseAtIndex expenseIndex: IndexPath) {
        let expense = self.displayableExpenses[expenseIndex.item]
        
        self.useCase.set(expenseCategory: category, toExpenseWithId: expense.expenseId)
        self.reloadContent()
    }
    
    func setAlways(category: ExpenseCategory, toExpenseAtIndex expenseIndex: IndexPath) {
        let expense = self.displayableExpenses[expenseIndex.item]
        
        self.useCase.set(expenseCategory: category, toExpenseWithId: expense.genericExpenseId)
        self.reloadContent()
    }
    
}
