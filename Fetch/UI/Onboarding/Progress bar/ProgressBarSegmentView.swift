//
//  ProgressBarSegmentView.swift
//  Fetch
//
//  Created by Alvin Andino on 3/24/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import UIKit

final class ProgressBarSegmentView: UIView {

    private enum Constants {
        static let animationDuration = 0.3
    }

    var isEnabled = false {
        didSet {
            updateBackground(withNewEnabled: isEnabled, animated: true)
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        styleView()
    }

    // swiftlint:disable unavailable_function
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height / 2
    }

    private func styleView() {
        updateBackground(withNewEnabled: isEnabled)
    }

    private func updateBackground(withNewEnabled isEnabled: Bool, animated: Bool = false) {
        guard animated else {
            updateBackgroundColor(withNewEnabled: isEnabled)
            return
        }

        UIView.animate(withDuration: Constants.animationDuration) { [weak self] in
            self?.updateBackgroundColor(withNewEnabled: isEnabled)
        }
    }

    private func updateBackgroundColor(withNewEnabled isEnabled: Bool) {
        backgroundColor = isEnabled ? .progressBarSegmentEnabled : .progressBarSegmentDisabled
    }
}
