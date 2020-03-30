//
//  MultipleChoiceOnboardingQuestionTests.swift
//  FetchTests
//
//  Created by yi.hao on 3/26/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import XCTest
@testable import Fetch

class MultipleChoiceOnboardingQuestionTests: XCTestCase {

    func loadMultipleChoiceQuestion() -> OnboardingQuestion {
        return OnboardingQuestion(
            title: "I’m looking for a pet that’s",
            answerType: .multipleChoice,
            choices: ["Small",
                      "Medium",
                      "Large"],
            tip: "SELECT ALL THAT APPLY")
    }

    func testWithoutInput() {
        let sut = loadMultipleChoiceQuestion()
        XCTAssertEqual(sut.selectedIndexes, [])
        XCTAssertEqual(sut.tip, "SELECT ALL THAT APPLY")
        XCTAssertFalse(sut.isAnswered)
    }

    func testUserChooseOne() {
        let sut = loadMultipleChoiceQuestion()
        sut.selectChoice(at: 0)
        XCTAssertEqual(sut.selectedIndexes, [0])
        XCTAssertTrue(sut.isAnswered)
    }

    func testUserDoubleTap() {
        let sut = loadMultipleChoiceQuestion()
        sut.selectChoice(at: 0)
        XCTAssertEqual(sut.selectedIndexes, [0])
        XCTAssertTrue(sut.isAnswered)
        sut.selectChoice(at: 0)
        XCTAssertEqual(sut.selectedIndexes, [])
        XCTAssertFalse(sut.isAnswered)
    }

    func testUserChoiceOutOfBound() {
        let sut = loadMultipleChoiceQuestion()
        sut.selectChoice(at: 5)
        XCTAssertEqual(sut.selectedIndexes, [])
        XCTAssertFalse(sut.isAnswered)
    }

    func testUserChoiceOutOfBoundAfterAnswer() {
        let sut = loadMultipleChoiceQuestion()
        sut.selectChoice(at: 0)
        XCTAssertEqual(sut.selectedIndexes, [0])
        XCTAssertTrue(sut.isAnswered)
        sut.selectChoice(at: 5)
        XCTAssertEqual(sut.selectedIndexes, [0])
        XCTAssertTrue(sut.isAnswered)
    }

    func testUserChangeChoice() {
        let sut = loadMultipleChoiceQuestion()
        sut.selectChoice(at: 0)
        XCTAssertEqual(sut.selectedIndexes, [0])
        XCTAssertTrue(sut.isAnswered)
        sut.selectChoice(at: 2)
        XCTAssertEqual(sut.selectedIndexes, [0, 2])
        XCTAssertTrue(sut.isAnswered)
    }
}
