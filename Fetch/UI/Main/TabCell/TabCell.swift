//
//  TabBarCell.swift
//  Fetch
//
//  Created by yi.hao on 4/7/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import Foundation
import UIKit

final class TabCell: UICollectionViewCell {

    static let cellIdentifier = "TabCell"

    @IBOutlet var iconImageView: UIImageView!
    @IBOutlet var barView: UIView!
    @IBOutlet var numberLabel: UILabel!

    func setup(icon: UIImage, currentNumber: Int?, selected: Bool) {
        iconImageView.image = icon
        barView.backgroundColor = UIColor.tabSelected
        if selected {
            select()
        } else {
            unselect()
        }
        if let currentNumber = currentNumber {
            numberLabel.text = String(currentNumber)
            numberLabel.isHidden = false
        } else {
            numberLabel.isHidden = true
        }
    }

    private func select() {
        iconImageView.tintColor = UIColor.tabSelected
        barView.isHidden = false
        numberLabel.textColor = UIColor.tabTextSelected
    }

    private func unselect() {
        iconImageView.tintColor = UIColor.tabUnselected
        barView.isHidden = true
        numberLabel.textColor = UIColor.tabTextUnselected
    }
}
