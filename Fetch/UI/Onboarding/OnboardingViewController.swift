//
//  OnboardingViewController.swift
//  Fetch
//
//  Created by yi.hao on 3/18/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import UIKit

final class OnboardingViewController: UIViewController {

    @IBOutlet var progressBarView: ProgressBarView!

    weak var coordinator: MainCoordinator?
    private let viewModel: OnboardingViewModel

    init(viewModel: OnboardingViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        progressBarView.viewModel = viewModel
    }

    @IBAction func backButtonTapped(_ sender: UIButton) {
        viewModel.backButtonTapped()
    }

    @IBAction func nextButtonTapped(_ sender: UIButton) {
        viewModel.nextButtonTapped()
    }
}
