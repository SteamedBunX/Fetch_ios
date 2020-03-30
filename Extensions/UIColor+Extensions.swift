//
//  UIColor+Extensions.swift
//  Fetch
//
//  Created by Alvin Andino on 3/24/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import UIKit

extension UIColor {
    static func rgba(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: alpha)
    }

    static var progressBarSegmentEnabled: UIColor { return .rgba(red: 227, green: 121, blue: 69) }
    static var progressBarSegmentDisabled: UIColor { return .rgba(red: 59, green: 81, blue: 98) }
}
