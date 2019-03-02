//
//  ExpenseTableViewCell.swift
//  Camililo-IOS
//
//  Created by William Hass on 2018-12-30.
//  Copyright © 2018 lilohass. All rights reserved.
//

import UIKit

class ExpenseTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    static var defaultReuseIdentifier = "ExpenseTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

// MARK: - ExpenseCellProtocol
extension ExpenseTableViewCell: ExpenseCellProtocol {
    func set(date: String) {
        self.dateLabel.text = date
    }
    func set(name: String) {
        self.nameLabel.text = name
    }
    func set(value: String) {
        self.valueLabel.text = value
    }
    func set(categoryName: String) {
        self.categoryLabel.text = categoryName
    }
}
