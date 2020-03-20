//
//  OnboardingViewModel.swift
//  Fetch
//
//  Created by yi.hao on 3/18/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import Foundation

protocol OnboardingViewModelDelegate: AnyObject {

    func questionDidChange(movedForward: Bool)
    func sectionDidChange(movedForward: Bool)
    func selectedIndexesDidChange()
    func textInputDidChange()
    func finishSequence()
}

final class OnboardingViewModel {

    weak var delegate: OnboardingViewModelDelegate?

    private let flow: OnboardingSequence

    init(flow: OnboardingSequence) {
        self.flow = flow
    }

    // MARK: - ProgressBar Related Displayable

    var numberOfSections: Int {
        return flow.sections.count
    }

    var currentSectionIndex: Int {
        return flow.currentSectionIndex
    }

    // MARK: - Section Related Displayable

    var currentSectionTitle: String {
        return flow.currentSection?.title ?? ""
    }

    var sectionProgressText: String {
        return "Question \(flow.currentQuestionIndex + 1) of \(flow.currentSectionSize)"
    }

    // MARK: - Question Related Displayable
    var currentQuestionTitle: String {
        return flow.currentQuestion?.title ?? ""
    }

    var currentQuestionType: OnboardingAnswerType {
        return flow.currentQuestion?.type ?? .singleChoice
    }

    var currentQuestionChoices: [String]? {
        return flow.currentQuestion?.choices
    }

    var currentQuestionAnswered: Bool? {
        return flow.currentQuestion?.isAnswered
    }

    // MARK: - UserInputs

    func selectChoice(at index: Int) {
        flow.selectChoice(at: index)
        delegate?.selectedIndexesDidChange()
    }

    func setInputText(newInputText: String) {
        flow.setInputText(newInputText: newInputText)
        delegate?.textInputDidChange()
    }

    // MARK: - Moving to Different question

    func nextButtonTapped() {
        flow.moveToNextQuestion()
        delegate?.questionDidChange(movedForward: true)
        if flow.currentQuestionIndex == 0 {
            delegate?.sectionDidChange(movedForward: true)
        }
    }

    func backButtonTapped() {
        flow.moveToPreviousQuestion()
        delegate?.questionDidChange(movedForward: false)
        if flow.currentQuestionIndex == flow.currentSectionSize - 1 {
            delegate?.sectionDidChange(movedForward: false)
        }
    }

    func doneButtonTapped() {
        // TODO: register user with profile
        delegate?.finishSequence()
    }
}
