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
    private(set) var choices: [String]? = []
    private(set) var selectedIndexes = [Int]()
    // Text Based Fields
    private(set) var inputText: String = ""
    private(set) var placeHolderText: String = ""
    private(set) var inputKeyboardType: KeyboardType = .text
    private let minInputLength: Int
    private(set) var maxInputLength: Int

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
         tip: String? = nil) {
        self.type = questionType
        self.title = title
        self.tip = tip
        self.choices = choices
        self.minInputLength = 0
        self.maxInputLength = 0
    }

    // Init for TextQuestions
    init(title: String, minInputLength: Int, maxInputLength: Int, tip: String? = nil, placeHolderText: String = "", inputKeyboardType: KeyboardType = .text) {
        self.type = .textInput
        self.title = title
        self.tip = tip
        self.placeHolderText = placeHolderText
        self.minInputLength = minInputLength
        self.maxInputLength = maxInputLength
        self.choices = []
        self.inputKeyboardType = inputKeyboardType
    }

    func selectChoice(at index: Int) {
        guard index < choices?.count ?? 0 else { return }
        switch type {
        case .multipleChoice:
            if selectedIndexes.contains(index) {
                selectedIndexes.removeAll(where: {$0 == index})
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
