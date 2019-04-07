//
//  UITableViewCell+Register.swift
//  Camililo-IOS
//
//  Created by William Hass on 2019-04-06.
//  Copyright © 2019 lilohass. All rights reserved.
//

import UIKit

extension UITableViewCell {
    
    static var nibName: String { return String(describing: self) }
    static var reuseId: String { return String(describing: self) }
    
    static func registerForTableView(_ tableView: UITableView) {
        if let nib = self.nib() {
            tableView.register(nib, forCellReuseIdentifier: self.reuseId)
        } else {
            tableView.register(self, forCellReuseIdentifier: self.reuseId)
        }
    }
    
    static var bundle: Bundle? {
        return Bundle(for: self)
    }
    
    static func nib() -> UINib? {
        return UINib(nibName: self.nibName, bundle: self.bundle)
    }
}
