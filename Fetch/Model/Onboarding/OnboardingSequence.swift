//
//  OnboardingSequence.swift
//  Fetch
//
//  Created by yi.hao on 3/19/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import Foundation

final class OnboardingSequence {

    // MARK: - Variables

    let sections: [OnboardingSection]
    private(set) var currentQuestionIndex = 0
    private(set) var currentSectionIndex = 0

    var currentSectionSize: Int {
        return currentSection?.numberOfQuestions ?? 0
    }

    var currentSection: OnboardingSection? {
        return section(for: currentSectionIndex)
    }

    var currentQuestion: OnboardingQuestion? {
        return section(for: currentSectionIndex)?.question(for: currentQuestionIndex)
    }

    var isFirstQuestion: Bool {
        return currentQuestionIndex == 0 && currentSectionIndex == 0
    }

    var isLastQuestion: Bool {
        return currentSectionIndex == sections.count - 1 && currentQuestionIndex == currentSectionSize - 1
    }

    // MARK: - Initializer

    init(sections: [OnboardingSection]) {
        self.sections = sections
    }

    // MARK: - UserInputs

    func selectChoice(at index: Int) {
        currentQuestion?.selectChoice(at: index)
    }

    func setInputText(newInputText: String) {
        currentQuestion?.setInputText(newInputText)
    }

    // MARK: - FlowControl

    func moveToPreviousQuestion() {
        guard !isFirstQuestion else { return }
        if currentQuestionIndex <= 0 {
            currentSectionIndex -= 1
            currentQuestionIndex = currentSectionSize - 1
        } else {
            currentQuestionIndex -= 1
        }
    }

    func moveToNextQuestion() {
        guard !isLastQuestion else { return }
        if currentQuestionIndex >= currentSectionSize - 1 {
            currentSectionIndex += 1
            currentQuestionIndex = 0
        } else {
            currentQuestionIndex += 1
        }
    }

    // MARK: - Retrieving Data

    private func section(for index: Int) -> OnboardingSection? {
        return sections[ip_safely: index]
    }
}
