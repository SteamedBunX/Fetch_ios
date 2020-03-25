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

    var viewModel: ProgressBarViewModel = ProgressBarViewModel() {
        didSet {
            bindToViewModel()
        }
    }

    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupStackView()
        bindToViewModel()
    }

    func progress() {
        viewModel.progress()
    }

    func `return`() {
        viewModel.return()
    }

    private func setupStackView() {
        spacing = Constants.spacing
        distribution = .fillEqually
    }

    private func bindToViewModel() {
        viewModel.update = updateSegments
        setupSegments()
    }

    private func setupSegments() {
        viewModel.validIndexes
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
        return viewModel.isEnabled(atIndex: index)
    }
}
