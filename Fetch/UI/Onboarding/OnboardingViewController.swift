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
    @IBOutlet private var questionInputTextField: UITextField!
    @IBOutlet private var backButton: UIButton!
    @IBOutlet private var nextButton: UIButton!

    let viewModel: OnboardingViewModel
    weak var coordinator: MainCoordinator?

    // MARK: - Initial Setup

    init(viewModel: OnboardingViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "OnboardingViewController", bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        setupView()
        progressBarView.viewModel = viewModel
        loadFirstQuestion()
    }

    private func setupView() {
        setupTextField()
        setupNavigationButton()
    }

    private func setupTextField() {
        questionInputTextField.layer.applyShadowWith(alpha: 0.31, blur: 9)
        questionInputTextField.delegate = self
        setupKeyboardToolBar()
    }

    private func setupKeyboardToolBar() {
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        toolbar.barStyle = .default
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(keyboardInputDidFinish))
        toolbar.setItems([flexSpace, doneButton], animated: false)
        questionInputTextField.inputAccessoryView = toolbar
    }

    private func setupNavigationButton() {
        backButton.setupForNavigation()
        nextButton.setupForNavigation()
    }

    // MARK: - Loading Questions

    private func loadFirstQuestion() {
        addNewQuestionToScreen(movedForward: true)
    }

    private func addNewQuestionToScreen(movedForward: Bool) {
        switch viewModel.currentQuestionType {
        case .multipleChoice:
            break
        case .singleChoice:
            break
        case .textInput:
            addTextInputQuestionToScreen()
        }
        updateButtonState()
    }

    private func addTextInputQuestionToScreen() {
        questionTitleLabel.text = viewModel.currentQuestionTitle
        questionInputTextField.placeholder = viewModel.currentQuestionPlaceHolderText
        questionTipLabel.text = viewModel.currentQuestionTip
        questionInputTextField.isHidden = false
        switch viewModel.currentQuestionKeyboardType {
        case .digit:
            questionInputTextField.keyboardType = .numberPad
        case .phonePad:
            questionInputTextField.keyboardType = .phonePad
        case .text:
            questionInputTextField.keyboardType = .default
        }
    }

    // MARK: - State Updates

    private func updateButtonState() {
        backButton.changeOnboardingNavigationState(to: viewModel.backButtonState)
        nextButton.changeOnboardingNavigationState(to: viewModel.nextButtonState)
    }

    // MARK: - Actions

    @IBAction private func backButtonTapped(_ sender: Any) {

    }

    @IBAction private func nextButtonTapped(_ sender: Any) {

    }

    @objc private func keyboardInputDidFinish() {
        view.endEditing(true)
        self.viewModel.setInputText(newInputText: questionInputTextField.text ?? "")
    }
}

extension OnboardingViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        viewModel.setInputText(newInputText: textField.text ?? "")
        return true
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentString = textField.text as NSString? ?? ""
        let newString = currentString.replacingCharacters(in: range, with: string)
        return viewModel.currentQuestionCanAccept(input: newString)
    }
}

extension OnboardingViewController: OnboardingViewModelDelegate {

    func questionDidChange(movedForward: Bool) {

    }

    func sectionDidChange(movedForward: Bool) {

    }

    func selectedIndexesDidChange() {

    }

    func textInputDidChange() {
        self.updateButtonState()
    }

    func finishSequence() {

    }
}

private extension UIButton {

    func setupForNavigation() {
        self.setTitleColor(UIColor.buttonEnabledColor, for: .normal)
        self.setTitleColor(UIColor.buttonDisabledColor, for: .disabled)
        self.setTitleColor(UIColor.buttonEnabledColor, for: .highlighted)
        let highlightImage = self.imageView?.image?.withTintColor(.buttonEnabledColor, renderingMode:.alwaysOriginal)
        self.setImage(highlightImage, for: .highlighted)
    }

    func changeOnboardingNavigationState(to state: ButtonState) {
        switch state {
        case .enabled:
            self.enable()
        case .disabled:
            self.disable()
        case .hidden:
            self.hide()
        }
    }

    private func enable() {
        self.isHidden = false
        self.tintColor = UIColor.buttonEnabledColor
        self.isEnabled = true
    }

    private func disable() {
        self.isHidden = false
        self.tintColor = UIColor.buttonDisabledColor
        self.isEnabled = false
    }

    private func hide() {
        self.isHidden = true
    }
}
