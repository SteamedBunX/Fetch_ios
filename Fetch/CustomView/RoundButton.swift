//
//  UIButtonWithShadowAndRoundCorner.swift
//  Fetch
//
//  Created by yi.hao on 3/19/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable final class RoundButton: UIButton {

    @IBInspectable var enableBorder: Bool = false
    @IBInspectable var borderColor: UIColor = UIColor.white
    @IBInspectable var borderWidth: CGFloat = 0

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.size.height / 2
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
    }
}
