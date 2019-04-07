//
//  BudgetSetupViewController.swift
//  Camililo-IOS
//
//  Created by William Hass on 2019-04-06.
//  Copyright © 2019 lilohass. All rights reserved.
//

import UIKit

class BudgetSetupViewController: UIViewController {

    var eventHandler: BudgetSetupViewEventHandler?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.eventHandler?.viewDidLoad()
    }
    
    @IBAction func closeButtonTapped() {
        self.eventHandler?.userDidTapCloseButton()
    }
    
}

// MARK: - BudgetSetupView
extension BudgetSetupViewController: BudgetSetupView {
    
}

// MARK: - UITableViewDelegate
extension BudgetSetupViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Categories"
    }
    
}

// MARK: - UITableViewDataSource
extension BudgetSetupViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        return cell
    }
    
    
}
