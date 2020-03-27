//
//  UIButton+Extension.swift
//  Fetch
//
//  Created by yi.hao on 3/27/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {

    func setupForNavigation() {
        setTitleColor(UIColor.buttonEnabledColor, for: .normal)
        setTitleColor(UIColor.buttonDisabledColor, for: .disabled)
        setTitleColor(UIColor.buttonEnabledColor, for: .highlighted)
        let highlightImage = imageView?.image?.withTintColor(.buttonEnabledColor, renderingMode:.alwaysOriginal)
        setImage(highlightImage, for: .highlighted)
    }

    func changeStateAsNavigationButton(to state: ButtonState) {
        switch state {
        case .enabled:
            enable()
        case .disabled:
            disable()
        case .hidden:
            hide()
        }
    }

    private func enable() {
        isHidden = false
        tintColor = UIColor.buttonEnabledColor
        isEnabled = true
    }

    private func disable() {
        isHidden = false
        tintColor = UIColor.buttonDisabledColor
        isEnabled = false
    }

    private func hide() {
        isHidden = true
    }
}
