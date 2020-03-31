//
//  UIButtonWithShadowAndRoundCorner.swift
//  Fetch
//
//  Created by yi.hao on 3/19/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable final class CustomRoundSidedUIButton: UIButton {

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        styleView()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        styleView()
    }

    private func styleView() {
        layer.cornerRadius = frame.size.height / 2
    }
}
