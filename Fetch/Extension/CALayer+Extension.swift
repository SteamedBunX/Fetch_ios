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
  func applyZeplinShadow(
    color: UIColor = .black,
    alpha: Float = 0.5,
    xOffset: CGFloat = 0,
    yOffset: CGFloat = 2,
    blur: CGFloat = 4,
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
}
