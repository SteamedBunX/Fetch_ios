//
//  CALayer+Extension.swift
//  Fetch
//
//  Created by yi.hao on 3/27/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import Foundation
import UIKit

extension CALayer {

    private func applyShadowWith(
        color: UIColor,
        alpha: Float,
        xOffset: CGFloat,
        yOffset: CGFloat,
        blur: CGFloat,
        spread: CGFloat = 0) {
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: xOffset, height: yOffset)
        shadowRadius = blur / 2.0
        if spread == 0 {
            shadowPath = nil
        } else {
            let deltaX = -spread
            let rect = bounds.insetBy(dx: deltaX, dy: deltaX)
            shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }

    func applyGoogleSignInButtonShadow() {
        applyShadowWith(color: .black, alpha: 0.24, xOffset: 0, yOffset: 2, blur: 2)
    }

    func applyAnswerTextFieldShadow() {
        applyShadowWith(color: .black, alpha: 0.31, xOffset: 0, yOffset: 0, blur: 9)
    }

    func applyAnswerChoiceButtonShadow() {
        applyShadowWith(color: .black, alpha: 0.31, xOffset: 0, yOffset: 2, blur: 9)
    }
}
