//
//  MockOnboardingViewModel.swift
//  Fetch
//
//  Created by yi.hao on 3/18/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import Foundation

class MockOnboardingViewModelForProgressBar: OnboardingViewModel {

    weak var delegate: OnboardingViewModelDelegate?

    var currentSection: Int = 0
    var sections = [Section(questions: []), Section(questions: []), Section(questions: [])]

    var totalSection: Int {
        return sections.count
    }

    func select(index: Int) {

    }

    func updateInput(currentInput: String) {

    }

    func toNextQuestion() {
        if currentSection >= totalSection {
            currentSection += 1
            delegate?.sectionDidChange(currentSection: currentSection)
        }
    }

    func toLastQuestion() {
        if currentSection <= 0 {
            currentSection -= 1
            delegate?.sectionDidChange(currentSection: currentSection)
        }
    }
}
