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
    @IBOutlet private var questionTitleLabel: UILabel!
    @IBOutlet private var questionTipLabel: UILabel!
    @IBOutlet private var questionTextField: UITextField!
    @IBOutlet private var backButton: UIButton!
    @IBOutlet private var nextButton: UIButton!

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
        setupView()
    }

    func setupView() {
        questionTextField.layer.shadowColor = UIColor.black.cgColor
        questionTextField.layer.shadowRadius = 9
        questionTextField.layer.shadowOpacity = 0.31
        questionTextField.layer.shadowOffset = CGSize(width: 0, height: 2)
    }
}
