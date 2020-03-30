//
//  OnboardingViewController.swift
//  Fetch
//
//  Created by yi.hao on 3/18/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import UIKit

final class OnboardingViewController: UIViewController {

    @IBOutlet private var progressBarView: ProgressBarView!
    @IBOutlet private var sectionTitleLabel: UILabel!
    @IBOutlet private var sectionProgressTextLabel: UILabel!
    @IBOutlet private var questionTitleLabel: UILabel!
    @IBOutlet private var questionTipLabel: UILabel!
    @IBOutlet private var answerTextField: UITextField!
    @IBOutlet private var answerChoiceTableView: UITableView!
    @IBOutlet private var backButton: UIButton!
    @IBOutlet private var nextButton: UIButton!
    @IBOutlet private var doneButton: UIButton!

    private let viewModel: OnboardingViewModel
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
        setupViews()
        loadFirstQuestion()
    }

    private func setupViews() {
        setupTextField()
        setupNavigationButton()
        setupTableView()
        progressBarView.viewModel = viewModel
    }

    private func setupTextField() {
        answerTextField.layer.applyAnswerTextFieldShadow()
        answerTextField.delegate = self
        setupKeyboardToolBar()
    }

    private func setupTableView() {
        let nib = UINib(nibName: "AnswerChoiceCell", bundle: nil)
        answerChoiceTableView.register(nib, forCellReuseIdentifier: "AnswerChoiceCell")
        answerChoiceTableView.delegate = self
        answerChoiceTableView.dataSource = self
    }

    private func setupKeyboardToolBar() {
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        toolbar.barStyle = .default
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(keyboardInputDidFinish))
        toolbar.setItems([flexSpace, doneButton], animated: false)
        answerTextField.inputAccessoryView = toolbar
    }

    private func setupNavigationButton() {
        backButton.setupForNavigation()
        nextButton.setupForNavigation()
        doneButton.setupForNavigation()
    }

    // MARK: - Loading Questions

    private func loadFirstQuestion() {
        addNewQuestionToScreen(movedForward: true)
        updateSection(movedForward: true)
    }

    private func updateSection(movedForward: Bool) {
        sectionTitleLabel.text = viewModel.currentSectionTitle
    }

    private func addNewQuestionToScreen(movedForward: Bool) {
        // TODO: User SnapView to save the current question and Hide the actual views.
        sectionProgressTextLabel.text = viewModel.sectionProgressText
        questionTitleLabel.text = viewModel.currentQuestionTitle
        questionTipLabel.text = viewModel.currentQuestionTip
        switch viewModel.currentQuestionType {
        case .multipleChoice,
             .singleChoice:
            addChoiceQuestionToScreen()
        case .textInput:
            addTextInputQuestionToScreen()
        }
        updateButtonState()
        // TODO: Animate the snapView and actual view to create a transition annimation
    }

    private func addChoiceQuestionToScreen() {
        answerChoiceTableView.isHidden = false
        answerTextField.isHidden = true
        answerChoiceTableView.reloadData()
    }

    private func addTextInputQuestionToScreen() {
        answerTextField.placeholder = viewModel.currentQuestionPlaceHolderText
        answerChoiceTableView.isHidden = true
        answerTextField.isHidden = false
        switch viewModel.currentQuestionKeyboardType {
        case .digit:
            answerTextField.keyboardType = .numberPad
        case .phonePad:
            answerTextField.keyboardType = .phonePad
        case .text:
            answerTextField.keyboardType = .default
        }
    }

    // MARK: - State Updates

    private func updateButtonState() {
        backButton.changeOnboardingNavigationState(to: viewModel.backButtonState)
        nextButton.changeOnboardingNavigationState(to: viewModel.nextButtonState)
        doneButton.changeOnboardingNavigationState(to: viewModel.doneButtonState)
    }

    // MARK: - Actions

    @IBAction private func backButtonTapped(_ sender: Any) {
        viewModel.backButtonTapped()
    }

    @IBAction private func nextButtonTapped(_ sender: Any) {
        viewModel.nextButtonTapped()
    }

    @IBAction private func doneButtonTapped(_ sender: Any) {

    }
    @objc private func keyboardInputDidFinish() {
        view.endEditing(true)
        self.viewModel.setInputText(newInputText: answerTextField.text ?? "")
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
        addNewQuestionToScreen(movedForward: movedForward)
    }

    func sectionDidChange(movedForward: Bool) {
        updateSection(movedForward: movedForward)
    }

    func selectedIndexesDidChange() {
        answerChoiceTableView.reloadData()
        updateButtonState()
    }

    func textInputDidChange() {
        updateButtonState()
    }

    func finishSequence() {

    }
}

extension OnboardingViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.currentQuestionChoices?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AnswerChoiceCell") as? AnswerChoiceCell else {
            return UITableViewCell()
        }
        let index = indexPath.row
        let answer = viewModel.currentQuestionChoices?[index] ?? ""
        let selected = viewModel.currentQuestionSelectedChoiceIndexes.contains(index)
        cell.setup(index: indexPath.row, answer: answer, selected: selected)
        cell.setDelegate(self)
        return cell
    }
}

extension OnboardingViewController: AnswerChoiceCellDelegate {
    func buttonTapped(at index: Int) {
        viewModel.selectChoice(at: index)
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
