//
//  UIButtonWithShadowAndRoundCorner.swift
//  Fetch
//
//  Created by yi.hao on 3/19/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class CustomRoundSidedUIButton: UIButton {

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.styleView()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.styleView()
    }

    func styleView() {
        layer.cornerRadius = frame.size.height / 2
    }
}
