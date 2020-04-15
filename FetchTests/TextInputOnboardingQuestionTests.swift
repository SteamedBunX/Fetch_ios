//
//  FetchTests.swift
//  FetchTests
//
//  Created by Harry Nelken on 3/9/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import XCTest
@testable import Fetch

class TextInputOnboardingQuestionTests: XCTestCase {

    func loadTextInputQuestion() -> OnboardingQuestion {
        return OnboardingQuestion(
            title: "My zip code is",
            reference: .zipCode,
            minInputLength: 5,
            maxInputLength: 10,
            placeHolderText: "Enter your zip code here",
            inputKeyboardType: .digit)
    }

    func testWithoutInput() {
        let sut = loadTextInputQuestion()
        XCTAssertFalse(sut.isAnswered)
    }

    func testWithShorterThanMinInput() {
        let sut = loadTextInputQuestion()
        sut.setInputText("1234")
        XCTAssertFalse(sut.isAnswered)
    }

    func testWithEqualToMinInput() {
        let sut = loadTextInputQuestion()
        sut.setInputText("12344")
        XCTAssertTrue(sut.isAnswered)
    }

    func testWithMoreThanMinLessThanMaxInput() {
        let sut = loadTextInputQuestion()
        sut.setInputText("12345678")
        XCTAssertTrue(sut.isAnswered)
    }

    func testWithEqualToMaxInput() {
        let sut = loadTextInputQuestion()
        sut.setInputText("1234567890")
        XCTAssertTrue(sut.isAnswered)
    }

    func testWithMoreThanMaxInput() {
        let sut = loadTextInputQuestion()
        sut.setInputText("1234567890123")
        XCTAssertFalse(sut.isAnswered)
    }

    func testAnswerThanNotAnswered() {
        let sut = loadTextInputQuestion()
        sut.setInputText("12345678")
        XCTAssertTrue(sut.isAnswered)
        sut.setInputText("1234")
        XCTAssertFalse(sut.isAnswered)
    }
}
