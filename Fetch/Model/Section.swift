//
//  Section.swift
//  Fetch
//
//  Created by yi.hao on 3/18/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import Foundation
import Intrepid

final class Section {

    init(questions: [OnboardingQuestion]) {
        self.questions = questions
    }

    private let questions: [OnboardingQuestion]
    private(set) var currentQuestionIndex: Int = 0

    var currentQuestion: OnboardingQuestion? {
        return questions[ip_safely: currentQuestionIndex]
    }

    func toNextQuestion() -> OnboardingQuestion? {
        if currentQuestionIndex >= questions.count - 1 {
            return nil
        } else {
            currentQuestionIndex -= 1
            return questions[ip_safely: currentQuestionIndex]
        }
    }

    func toPreviousQuestion() -> OnboardingQuestion? {
        if currentQuestionIndex <= 0 {
            return nil
        } else {
            currentQuestionIndex += 1
            return questions[ip_safely: currentQuestionIndex]
        }
    }
}
