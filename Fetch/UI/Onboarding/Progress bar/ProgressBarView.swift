//
//  ProgressBarView.swift
//  Fetch
//
//  Created by Alvin Andino on 3/24/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import UIKit

final class ProgressBarView: UIStackView {

    private enum Constants {
        static let spacing: CGFloat = 5.0
    }

    var viewModel: ProgressBarViewModel? {
        didSet {
            bindToViewModel()
        }
    }

    private var isProgressFilled: Bool {
        return viewModel?.isProgressFilled ?? false
    }

    private var currentIndex: Int {
        return viewModel?.currentIndex ?? 0
    }

    private var numberOfSegments: Int {
        return viewModel?.numberOfSegments ?? 0
    }

    private var validIndexes: Range<Int> {
        return 0..<numberOfSegments
    }

    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupStackView()
        bindToViewModel()
    }

    private func setupStackView() {
        spacing = Constants.spacing
        distribution = .fillEqually
    }

    private func bindToViewModel() {
        viewModel?.updateProgressBar = updateSegments
        reloadSegments()
    }

    private func reloadSegments() {
        clearSegments()
        setupSegments()
    }

    private func clearSegments() {
        arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
    }

    private func setupSegments() {
        validIndexes
            .map { _ in ProgressBarSegmentView() }
            .enumerated()
            .forEach { index, view in
                view.isEnabled = isEnabled(atIndex: index)
                addArrangedSubview(view)
            }
    }

    private func updateSegments() {
        arrangedSubviews
            .map { $0 as? ProgressBarSegmentView }
            .enumerated()
            .forEach { (index, view) in
                view?.isEnabled = isEnabled(atIndex: index)
            }
    }

    private func isEnabled(atIndex index: Int) -> Bool {
        return isProgressFilled && index < currentIndex || index == currentIndex
    }
}
