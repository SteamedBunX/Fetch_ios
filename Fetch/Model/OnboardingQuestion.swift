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
    let tip: String?
    // Choice Based Fields
    let choices: [String]?
    private(set) var selectedIndexes = [Int]()
    // Text Based Fields
    private(set) var inputText: String = ""
    private(set) var placeHolderText: String = ""
    private let minInputLength: Int
    let maxInputLength: Int

    var isAnswered: Bool {
        switch type {
        case .multipleChoice,
             .singleChoice:
            return !selectedIndexes.isEmpty
        case .textInput:
            return inputText.count >= minInputLength && inputText.count <= maxInputLength
        }
    }

    // Init for ChoiceQuestions
    init(title: String,
         questionType: OnboardingAnswerType,
         choices: [String] = [],
         hint: String? = nil) {
        self.type = questionType
        self.title = title
        self.tip = hint
        self.choices = choices
        self.minInputLength = 0
        self.maxInputLength = 0
    }

    // Init for TextQuestions
    init(title: String, minInputLength: Int, maxInputLength: Int, hint: String? = nil, placeHolderText: String = "") {
        self.type = .textInput
        self.title = title
        self.tip = hint
        self.placeHolderText = placeHolderText
        self.minInputLength = minInputLength
        self.maxInputLength = maxInputLength
        self.choices = []
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

enum TextInputType {
    case digit
    case text
}
