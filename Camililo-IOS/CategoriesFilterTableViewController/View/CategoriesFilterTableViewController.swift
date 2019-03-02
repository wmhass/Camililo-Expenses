//
//  CategoriesFilterTableViewController.swift
//  Camililo-IOS
//
//  Created by William Hass on 2019-01-12.
//  Copyright © 2019 lilohass. All rights reserved.
//

import UIKit

class CategoriesFilterTableViewController: UITableViewController {

    var eventHandler: CategoriesFilterViewEventHandler?
    let cellReuseId: String = "Cell"
    var numberOfCategories: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
        self.eventHandler?.viewDidLoad()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.numberOfCategories
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellReuseId, for: indexPath)

        self.eventHandler?.configure(cell: cell, indexPath: indexPath)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.eventHandler?.didSelectItem(atIndexPath: indexPath)
    }

    @IBAction func applyButtonTouched() {
        self.eventHandler?.applyButtonTouched()
    }
    
    @IBAction func closeButtonTouched() {
        self.eventHandler?.dismissButtonTapped()
    }
    
    @IBAction func clearButtonTouched() {
        self.eventHandler?.clearButtonTouched()
    }
    
    @IBAction func selectAllButtonTouched() {
        self.eventHandler?.selectAllButtonTouched()
    }
}

// MARK: - CategoriesFilterView
extension CategoriesFilterTableViewController: CategoriesFilterView {
    
    func showApplyButton(_ shouldShow: Bool) {
        if !shouldShow {
            self.navigationItem.rightBarButtonItem = nil
        }
    }
    
    func showSelectionToolBar(_ shouldShow: Bool) {
        self.navigationController?.setToolbarHidden(shouldShow == false, animated: false)
    }
    
    func set(numberOfCategories: Int) {
        self.numberOfCategories = numberOfCategories
    }
    
    func reloadData() {
        self.tableView.reloadData()
    }
    
    func reloadItem(atIndexPath indexPath: IndexPath) {
        self.tableView.reloadRows(at: [indexPath], with: UITableView.RowAnimation.fade)
    }
    
}
