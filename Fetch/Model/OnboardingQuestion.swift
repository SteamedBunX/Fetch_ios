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
    let type: OnboardingAnswerType
    let choices: [String]?
    private(set) var selectedIndexes = [Int]()
    private(set) var inputText: String?

    var isAnswered: Bool {
        switch type {
        case .multipleChoice,
             .singleChoice:
            return !selectedIndexes.isEmpty
        case .textInput:
            return inputText?.count == 5
        }
    }

    init(title: String, questionType: OnboardingAnswerType, choices: [String] = []) {
        self.title = title
        self.choices = choices
        self.type = questionType
    }

    func selectChoice(at index: Int) {
        switch type {
        case .multipleChoice:
            if selectedIndexes.contains(index) {
                selectedIndexes.removeFirst(index)
            } else {
                selectedIndexes.append(index)
            }
        case .singleChoice:
            if selectedIndexes.isEmpty {
                selectedIndexes = [index]
            } else {
                selectedIndexes[0] = index
            }
        case .textInput:
            break
        }
    }

    func setInputText(_ inputText: String) {
        self.inputText = inputText
    }
}

enum OnboardingAnswerType {
    case singleChoice
    case multipleChoice
    case textInput
}
