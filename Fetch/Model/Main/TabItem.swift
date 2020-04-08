//
//  File.swift
//  Fetch
//
//  Created by yi.hao on 4/8/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import UIKit

struct TabItem {
    let icon: UIImage
    var isSelected: Bool
    var currentNumber: Int?

    mutating func select() {
        isSelected = true
    }

    mutating func unSelect() {
        isSelected = false
    }

    mutating func updateNumber(to number: Int) {
        currentNumber = number
    }
}
