//
//  TabBarCell.swift
//  Fetch
//
//  Created by yi.hao on 4/7/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import Foundation
import UIKit

final class TabBarCell: UICollectionViewCell {

    static let cellIdentifier = "TabBarCell"

    @IBOutlet var iconImageView: UIImageView!
    @IBOutlet var barView: UIView!
    @IBOutlet var numberLabel: UILabel!

    func setup(item: TabBarItem) {
        iconImageView.image = item.icon
        barView.backgroundColor = .tabSelected
        setSelected(item.isSelected)
        if let currentNumber = item.currentNumber {
            numberLabel.text = String(currentNumber)
            numberLabel.isHidden = false
        } else {
            numberLabel.isHidden = true
        }
    }

    private func setSelected(_ selected: Bool) {
        iconImageView.tintColor = selected ? .tabSelected : .tabUnselected
        barView.isHidden = !selected
        numberLabel.textColor = selected ? .tabTextSelected : .tabTextUnselected
    }
}
