//
//  Question.swift
//  Fetch
//
//  Created by yi.hao on 3/18/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import Foundation

enum OnboardingAnswerType {
    case singleChoice
    case multipleChoice
    case textInput
}

final class OnboardingQuestion {

    let title: String
    let answerType: OnboardingAnswerType
    let tip: String?
    // Choice Based Fields
    let choices: [String]?
    private(set) var selectedIndexes = [Int]()
    // Text Based Fields
    private(set) var inputText: String = ""
    let placeHolderText: String
    let inputKeyboardType: KeyboardType
    private let minInputLength: Int
    let maxInputLength: Int

    var isAnswered: Bool {
        switch answerType {
        case .multipleChoice,
             .singleChoice:
            return !selectedIndexes.isEmpty
        case .textInput:
            return inputText.count >= minInputLength && inputText.count <= maxInputLength
        }
    }

    // Init for ChoiceQuestions
    init(title: String,
         answerType: OnboardingAnswerType,
         choices: [String] = [],
         tip: String? = nil) {
        self.answerType = answerType
        self.title = title
        self.tip = tip
        self.choices = choices
        self.placeHolderText = ""
        self.inputKeyboardType = .text
        self.minInputLength = 0
        self.maxInputLength = 0
    }

    // Init for TextQuestions
    init(title: String, minInputLength: Int, maxInputLength: Int, tip: String? = nil, placeHolderText: String = "", inputKeyboardType: KeyboardType = .text) {
        self.answerType = .textInput
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
        switch answerType {
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
