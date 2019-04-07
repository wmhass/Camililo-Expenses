//
//  UITableViewCell+CategoryItemView.swift
//  Camililo-IOS
//
//  Created by William Hass on 2019-01-12.
//  Copyright © 2019 lilohass. All rights reserved.
//

import UIKit

extension UITableViewCell: CategoryItemView {
    func set(title: String) {
        self.textLabel?.text = title
    }
    func set(selected: Bool) {
        if selected {
            self.accessoryType = .checkmark
        } else {
            self.accessoryType = .none
        }
    }
}
