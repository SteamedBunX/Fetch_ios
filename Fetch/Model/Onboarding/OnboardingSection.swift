//
//  Section.swift
//  Fetch
//
//  Created by yi.hao on 3/18/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import Foundation
import Intrepid

final class OnboardingSection {

    let title: String
    let questions: [OnboardingQuestion]
    private(set) var currentQuestionIndex: Int = 0

    var numberOfQuestions: Int {
        return questions.count
    }

    init(title: String, questions: [OnboardingQuestion]) {
        self.title = title
        self.questions = questions
    }

    func question(for index: Int) -> OnboardingQuestion? {
        return questions[ip_safely: index]
    }
}
