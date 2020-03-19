//
//  OnboardingViewModel.swift
//  Fetch
//
//  Created by yi.hao on 3/18/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import Foundation

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

    // MARK: - Question Related Displayable
    var currentQuestionTitle: String {
        return flow.currentQuestion?.title ?? ""
    }

    var currentQuestionType: OnboardingQuestionType {
        return flow.currentQuestion?.type ?? .singleChoice
    }

    var currentQuestionChoices: [String]? {
        return flow.currentQuestion?.choices
    }

    var currentQuestionAnswered: Bool? {
        return flow.currentQuestion?.isAnswered
    }

    // MARK: - UserInputs
    func choose(chosenIndex: Int) {
        flow.choose(chosenIndex: chosenIndex)
        delegate?.choiceDidUpdate()
    }

    func updateInput(newInputText: String) {
        flow.updateInput(newInputText: newInputText)
        delegate?.inputDidUpdate()
    }

    // MARK: - Moving to Different question
    func nextQuestion() {
        flow.moveToNextQuestion()
        delegate?.questionDidChange(position: .next)
    }

    func previousQuestion() {
        flow.moveToPreviousQuestion()
        delegate?.questionDidChange(position: .previous)
    }

    func flowComplete() {
        // communicate with the server to register the user
    }
}

protocol OnboardingViewModelDelegate: AnyObject {

    func questionDidChange(position: NewItemPosition)
    func sectionDidChange(position: NewItemPosition)
    func progressDidChange()
    func choiceDidUpdate()
    func inputDidUpdate()
}

enum NewItemPosition: Int {
    case previous = 1
    case next = -1
}
