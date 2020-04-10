//
//  UIColor.swift
//  Fetch
//
//  Created by yi.hao on 3/27/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {

    static let buttonEnabledColor = #colorLiteral(red: 0.8901960784, green: 0.4745098039, blue: 0.2705882353, alpha: 1)
    static let buttonDisabledColor = #colorLiteral(red: 0.4588235294, green: 0.4509803922, blue: 0.4392156863, alpha: 1)
    static let answerChoiceButtonSelected = #colorLiteral(red: 0.8901960784, green: 0.4745098039, blue: 0.2705882353, alpha: 1)
    static let answerChoiceButtonUnSelected = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    static let tabSelected = #colorLiteral(red: 0.8823529412, green: 0.4549019608, blue: 0.3490196078, alpha: 1)
    static let tabUnselected = #colorLiteral(red: 1, green: 0.8784313725, blue: 0.8235294118, alpha: 1)
    static let tabTextSelected = UIColor.white
    static let tabTextUnselected = #colorLiteral(red: 0.8823529412, green: 0.4549019608, blue: 0.3490196078, alpha: 1)

    static func rgba(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: alpha)
    }
    static var progressBarSegmentEnabled: UIColor { return .rgba(red: 227, green: 121, blue: 69) }
    static var progressBarSegmentDisabled: UIColor { return .rgba(red: 59, green: 81, blue: 98) }
}
