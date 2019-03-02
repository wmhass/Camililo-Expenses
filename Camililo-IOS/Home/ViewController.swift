//
//  ViewController.swift
//  Camililo-IOS
//
//  Created by William Hass on 2018-12-23.
//  Copyright © 2018 lilohass. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var expenses: [Expense] = []
    var eventHandler: HomeViewEventHandler!
    var numberOfExpenses: Int = 0
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var periodSummaryLabel: UILabel!
    @IBOutlet weak var fromDateButton: UIButton!
    @IBOutlet weak var toDateButton: UIButton!
    let connector = HomeConnector()
    var settingCategoryOfIndexPath: IndexPath?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.connector.connect(homeViewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.fromDateButton.layer.cornerRadius = 3.5
        self.fromDateButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)
        
        self.toDateButton.layer.cornerRadius = 3.5
        self.toDateButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)
        
        self.tableView.tableFooterView = UIView()

        self.eventHandler.viewDidLoad()        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if let categoriesSegue = segue as? HomeViewToCategoriesFilterTransition {
            self.eventHandler.prepare(transition: categoriesSegue)
        }
    }

    @IBAction func fromDateButtonTouched() {
        self.eventHandler.fromDateButtonTapped()
    }
    
    @IBAction func toDateButtonTouched() {
        self.eventHandler.toDateButtonTapped()
    }
    
}

// MARK: - HomeView
extension ViewController: HomeView {
    
    func presentDatePicker(title: String, selectedDate: Date?, completion: @escaping (_ newDate: Date?)->Void) {

        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.frame.size.width = self.view.frame.width
        datePicker.date = selectedDate ?? Date()
        
        let vc = UIViewController()
        vc.view.backgroundColor = UIColor.clear
        vc.view.addSubview(datePicker)
        vc.preferredContentSize = datePicker.frame.size
        
        let editRadiusAlert = UIAlertController(title: "", message: title, preferredStyle: .actionSheet)
        editRadiusAlert.setValue(vc, forKey: "contentViewController")
        
        let selectAction = UIAlertAction(title: "Select", style: .default) { action in
            completion(datePicker.date)
        }
        
        editRadiusAlert.addAction(selectAction)
        editRadiusAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(editRadiusAlert, animated: true)
    }
    
    func reloadCategories() {
        
    }
    
    func set(numberOfExpenses: Int) {
        self.numberOfExpenses = numberOfExpenses
    }
    
    func reloadData() {
        self.tableView.reloadData()
    }
    
    func set(total: String) {
        self.totalLabel.text = total
    }
    
    func set(period: String) {
        self.periodSummaryLabel.text = period
    }
    
    func set(minDate: String) {
        self.fromDateButton.setTitle(minDate, for: .normal)
    }
    
    func set(maxDate: String) {
        self.toDateButton.setTitle(maxDate, for: .normal)
    }
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.numberOfExpenses
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ExpenseTableViewCell.defaultReuseIdentifier, for: indexPath) as! ExpenseTableViewCell
        
        self.eventHandler?.configure(cell: cell, atIndexPath: indexPath)
        
        return cell
    }
    
    
}

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        self.performSegue(withIdentifier: CategoriesFilterSingleSelectionNavigationSegue.identifier, sender: indexPath)
        self.settingCategoryOfIndexPath = indexPath
    }
}

// MARK: - CategoriesFilterPresenterDelegate
extension ViewController: CategoriesFilterPresenterDelegate {
    
    func filter(categories: [ExpenseCategory]) {
        self.eventHandler.filter(categories: categories)
    }
    
}

// MARK: - CategoriesSingleSelectionPresenterDelegate
extension ViewController: CategoriesSingleSelectionPresenterDelegate {
    func selected(category: ExpenseCategory) {
        guard let indexPath = self.settingCategoryOfIndexPath else {
            return
        }
        
        let editRadiusAlert = UIAlertController(title: "", message: "Select category", preferredStyle: .actionSheet)
        
        let selectAction = UIAlertAction(title: "Only this", style: .default) { action in
            self.eventHandler?.setThis(category: category, toExpenseAtIndex: indexPath)
        }
        
        let selectAlwaysAction = UIAlertAction(title: "Always", style: .default) { action in
            self.eventHandler?.setAlways(category: category, toExpenseAtIndex: indexPath)
        }
        
        editRadiusAlert.addAction(selectAction)
        editRadiusAlert.addAction(selectAlwaysAction)
        editRadiusAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
//        delay(0.5) {
            self.present(editRadiusAlert, animated: true)
//        }
    }
}

