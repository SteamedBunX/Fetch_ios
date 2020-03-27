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
        self.setTitleColor(UIColor.buttonEnabledColor, for: .normal)
        self.setTitleColor(UIColor.buttonDisabledColor, for: .disabled)
        self.setTitleColor(UIColor.buttonEnabledColor, for: .highlighted)
        let highlightImage = self.imageView?.image?.withTintColor(.buttonEnabledColor, renderingMode:.alwaysOriginal)
        self.setImage(highlightImage, for: .highlighted)
    }

    func changeStateAsOnboardingNav(to state: ButtonState) {
        switch state {
        case .enabled:
            self.enableStateAsOnboardingNav()
        case .disabled:
            self.disableStateAsOnboardingNav()
        case .hidden:
            self.hideStateAsOnboardingNav()
        }
    }

    private func enableStateAsOnboardingNav() {
        self.isHidden = false
        self.tintColor = UIColor.buttonEnabledColor
        self.isEnabled = true
    }

    private func disableStateAsOnboardingNav() {
        self.isHidden = false
        self.tintColor = UIColor.buttonDisabledColor
        self.isEnabled = false
    }

    private func hideStateAsOnboardingNav() {
        self.isHidden = true
    }
}
