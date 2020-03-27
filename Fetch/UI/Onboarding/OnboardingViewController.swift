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

    let flow = OnboardingQuestions.load()
    let mockFlow = OnboardingQuestions.load()
    let viewModel = OnboardingViewModel(flow: OnboardingQuestions.loadOnlyZipCode())
    weak var coordinator: MainCoordinator?

    init(viewModel: OnboardingViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Initial Setup

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.nextButtonTapped()
        viewModel.delegate = self
        progressBarView.viewModel = viewModel
    }

    @IBAction func backButtonTapped(_ sender: UIButton) {
        viewModel.backButtonTapped()
    }

    @IBAction func nextButtonTapped(_ sender: UIButton) {
        viewModel.nextButtonTapped()
        setupView()
        loadFirstQuestion()
    }

    private func setupView() {
        setupTextField()
        setupNavigationButton()
        backButton.changeStateAsOnboardingNav(to: .enabled)
        nextButton.changeStateAsOnboardingNav(to: .disabled)
    }

    private func setupTextField() {
        questionInputTextField.layer.shadowColor = UIColor.black.cgColor
        questionInputTextField.layer.shadowRadius = 9
        questionInputTextField.layer.shadowOpacity = 0.31
        questionInputTextField.layer.shadowOffset = CGSize(width: 0, height: 2)
        questionInputTextField.delegate = self
        setupKeyboardToolBar()
    }

    private func setupKeyboardToolBar() {
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        toolbar.barStyle = .default
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneClicked))
        toolbar.setItems([flexSpace, doneButton], animated: false)
        questionInputTextField.inputAccessoryView = toolbar
    }

    @objc private func doneClicked() {
        view.endEditing(true)
        self.viewModel.setInputText(newInputText: questionInputTextField.text ?? "")
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
        backButton.changeStateAsOnboardingNav(to: viewModel.backButtonState)
        nextButton.changeStateAsOnboardingNav(to: viewModel.nextButtonState)
    }

    // MARK: - Actions

    @IBAction private func backButtonTapped(_ sender: Any) {

    }

    @IBAction private func nextButtonTapped(_ sender: Any) {

    }

}

extension OnboardingViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        self.viewModel.setInputText(newInputText: textField.text ?? "")
        return true
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = self.viewModel.currentQuestionMaxInputLength
        let currentString: NSString = textField.text as NSString? ?? ""
        let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
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
