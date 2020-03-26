//
//  OnboardingViewController.swift
//  Fetch
//
//  Created by yi.hao on 3/18/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import UIKit

final class OnboardingViewController: UIViewController {

<<<<<<< HEAD
    @IBOutlet var progressBarView: ProgressBarView!
=======
    weak var coordinator: MainCoordinator?

>>>>>>> d0ba2b9... [FETCH-112] Add Actual data and mock data.
    @IBOutlet private var questionTitleLabel: UILabel!
    @IBOutlet private var questionTipLabel: UILabel!
    @IBOutlet private var questionTextField: UITextField!
    @IBOutlet private var backButton: UIButton!
    @IBOutlet private var nextButton: UIButton!

<<<<<<< HEAD
    weak var coordinator: MainCoordinator?
    private let viewModel: OnboardingViewModel

    init(viewModel: OnboardingViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
=======
    let flow = OnboardingQuestions.load()
    let mockFlow = OnboardingQuestions.load()

    // MARK: - Initial Setup
>>>>>>> d0ba2b9... [FETCH-112] Add Actual data and mock data.

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
        setupTextFieldDropShadow()
        setupNavigationButton()
        backButton.enable()
        nextButton.disable()
    }

    func setupTextFieldDropShadow() {
        questionTextField.layer.shadowColor = UIColor.black.cgColor
        questionTextField.layer.shadowRadius = 9
        questionTextField.layer.shadowOpacity = 0.31
        questionTextField.layer.shadowOffset = CGSize(width: 0, height: 2)
    }

    func setupNavigationButton() {
        backButton.setupForNavigation()
        nextButton.setupForNavigation()
    }

    // MARK: - Button Action

    @IBAction func backButtonTapped(_ sender: Any) {

    }

    @IBAction func nextButtonTapped(_ sender: Any) {

    }
}

extension UIButton {

    func setupForNavigation() {
        self.setTitleColor(UIColor.buttonEnabledColor, for: .normal)
        self.setTitleColor(UIColor.buttonDisabledColor, for: .disabled)
        self.setTitleColor(UIColor.buttonEnabledColor, for: .highlighted)
        let highlightImage = self.imageView?.image?.withTintColor(.buttonEnabledColor, renderingMode:.alwaysOriginal)
        self.setImage(highlightImage, for: .highlighted)
    }

    func enable() {
        self.isHidden = false
        self.tintColor = UIColor.buttonEnabledColor
        self.isEnabled = true
    }

    func disable() {
        self.isHidden = false
        self.tintColor = UIColor.buttonDisabledColor
        self.isEnabled = false
    }

    func hide() {
        self.isHidden = true
    }
}

extension UIColor {
    static let buttonEnabledColor = UIColor(red: 227.0/255.0, green: 121.0/255.0, blue: 69.0/255.0, alpha: 1.0)
    static let buttonDisabledColor = UIColor(red: 117.0/255.0, green: 115.0/255.0, blue: 112.0/255.0, alpha: 1.0)
}
