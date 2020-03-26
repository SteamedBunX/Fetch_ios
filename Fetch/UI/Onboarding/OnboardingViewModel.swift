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
    var updateProgressBar: (() -> ())?

    weak var delegate: OnboardingViewModelDelegate?

    private let flow: OnboardingSequence

    init(flow: OnboardingSequence) {
        self.flow = flow
    }

    // MARK: - ProgressBar Related Displayable

    private var numberOfSections: Int {
        return flow.sections.count
    }

    private var currentSectionIndex: Int {
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

    var currentQuestionTip: String? {
        return flow.currentQuestion?.tip ?? ""
    }

    var currentQuestionType: OnboardingAnswerType {
        return flow.currentQuestion?.type ?? .singleChoice
    }

    private var currentQuestionAnswered: Bool? {
        return flow.currentQuestion?.isAnswered
    }

    // MARK: - Choice Question Displayable

    var currentQuestionChoices: [String]? {
        return flow.currentQuestion?.choices
    }

    var currentQuestionSelectedChoiceIndexes: [Int] {
        return flow.currentQuestion?.selectedIndexes ?? []
    }

    // MARK: - Text Input Question Displayable

    var currentQuestionPlaceHolderText: String {
        return flow.currentQuestion?.placeHolderText ?? ""
    }

    var currentQuestionMaxInputLength: Int {
        return flow.currentQuestion?.maxInputLength ?? 0
    }

    // MARK: - User Actions

    func selectChoice(at index: Int) {
        flow.selectChoice(at: index)
        delegate?.selectedIndexesDidChange()
    }

    func setInputText(newInputText: String) {
        flow.setInputText(newInputText: newInputText)
        delegate?.textInputDidChange()
    }

    // MARK: - Button State

    var backButtonState: ButtonState {
        if flow.isFirstQuestion {
            return .hidden
        }
        return .touchable
    }

    var nextButtonState: ButtonState {
        if flow.isLastQuestion {
            return .hidden
        }
        if currentQuestionAnswered == true {
            return .touchable
        }
        return .visible
    }

    var doneButtonState: ButtonState {
        if !flow.isLastQuestion {
            return .hidden
        }
        if currentQuestionAnswered == true {
            return .touchable
        }
        return .visible
    }

    // MARK: - Moving to Different question

    func nextButtonTapped() {
        flow.moveToNextQuestion()
        delegate?.questionDidChange(movedForward: true)
        if flow.currentQuestionIndex == 0 {
            delegate?.sectionDidChange(movedForward: true)
            updateProgressBar?()
        }
    }

    func backButtonTapped() {
        flow.moveToPreviousQuestion()
        delegate?.questionDidChange(movedForward: false)
        if flow.currentQuestionIndex == flow.currentSectionSize - 1 {
            delegate?.sectionDidChange(movedForward: false)
            updateProgressBar?()
        }
    }

    func doneButtonTapped() {
        // TODO: register user with profile
        delegate?.finishSequence()
    }
}

extension OnboardingViewModel: ProgressBarViewModel {
    var numberOfSegments: Int {
        return numberOfSections
    }

    var currentIndex: Int {
        return currentSectionIndex
    }
}

extension OnboardingViewModel {
    convenience init() {
        let sections = (0..<3).map { _ in
            return OnboardingSection(title: "", questions: [])
        }
        let flow = OnboardingSequence(sections: sections)
        self.init(flow: flow)
    }
}

enum ButtonState {
    case hidden, visible, touchable
}
