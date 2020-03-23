//
//  UIButtonWithShadowAndRoundCorner.swift
//  Fetch
//
//  Created by yi.hao on 3/19/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class CustomUIButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 0

    @IBInspectable var shadowColor: UIColor = UIColor.black
    @IBInspectable var shadowOpacity: Float = 0
    @IBInspectable var shadowRadius: CGFloat = 0
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0, height: 0)

//    signInButton.layer.cornerRadius = 5
//    signInButton.layer.shadowColor = UIColor.black.cgColor
//    signInButton.layer.shadowOpacity = 0.7
//    signInButton.layer.shadowRadius = 1
//    signInButton.layer.shadowOffset = CGSize(width: 0, height: 1)

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.styleView()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.styleView()
    }

    func styleView() {
        layer.cornerRadius = cornerRadius
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
        layer.shadowOffset = shadowOffset
    }
}
