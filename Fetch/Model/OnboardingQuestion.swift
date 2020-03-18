//
//  Question.swift
//  Fetch
//
//  Created by yi.hao on 3/18/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import Foundation

final class OnboardingQuestion {
    let title: String
    let type: OnboardingQuestionType
    let choices: [String]?
    var currentlySelectedIndexes = [Int]()
    private(set) var inputText: String?
    private(set) var isAnswered: Bool = false

    init(title: String, questionType: OnboardingQuestionType, choices: [String] = []) {
        self.title = title
        self.choices = choices
        self.type = questionType
    }

    func choose(index: Int) {
        switch type {
        case .multipleChoice:
            if currentlySelectedIndexes.contains(index) {
                currentlySelectedIndexes.removeFirst(index)
            } else {
                currentlySelectedIndexes.append(index)
            }
        case .singleChoice:
            if currentlySelectedIndexes.count <= 0 {
                currentlySelectedIndexes = [index]
            } else if currentlySelectedIndexes[0] == index {
                currentlySelectedIndexes = []
            } else {
                currentlySelectedIndexes[0] = index
            }
        default:
            break
        }
    }

    func setInputText(_ inputText: String) {
        self.inputText = inputText
    }
}

enum OnboardingQuestionType {
    case singleChoice
    case multipleChoice
    case textInput
}
