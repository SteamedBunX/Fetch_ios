//
//  TextSingleChoiceOnboardingQuestionTests.swift
//  FetchTests
//
//  Created by yi.hao on 3/26/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import XCTest
@testable import Fetch

class SingleChoiceOnboardingQuestionTests: XCTestCase {

    func loadSingleChoiceQuestion() -> OnboardingQuestion {
        return OnboardingQuestion(
            title: "When it comes to taking care of pets, I’m",
            reference: .experienceLevel,
            answerType: .singleChoice,
            choices: ["An Expert",
                      "Experienced",
                      "A Novice"])
    }

    func testWithoutInput() {
        let sut = loadSingleChoiceQuestion()
        XCTAssertFalse(sut.isAnswered)
    }

    func testUserChooseOne() {
        let sut = loadSingleChoiceQuestion()
        sut.selectChoice(at: 0)
        XCTAssertEqual(sut.selectedIndexes, [0])
        XCTAssertTrue(sut.isAnswered)
    }

    func testUserDoubleTap() {
        let sut = loadSingleChoiceQuestion()
        sut.selectChoice(at: 0)
        XCTAssertEqual(sut.selectedIndexes, [0])
        XCTAssertTrue(sut.isAnswered)
        sut.selectChoice(at: 0)
        XCTAssertEqual(sut.selectedIndexes, [0])
        XCTAssertTrue(sut.isAnswered)
    }

    func testUserChoiceOutOfBound() {
        let sut = loadSingleChoiceQuestion()
        sut.selectChoice(at: 5)
        XCTAssertEqual(sut.selectedIndexes, [])
        XCTAssertFalse(sut.isAnswered)
    }

    func testUserChoiceOutOfBoundAfterAnswer() {
        let sut = loadSingleChoiceQuestion()
        sut.selectChoice(at: 0)
        XCTAssertEqual(sut.selectedIndexes, [0])
        XCTAssertTrue(sut.isAnswered)
        sut.selectChoice(at: 5)
        XCTAssertEqual(sut.selectedIndexes, [0])
        XCTAssertTrue(sut.isAnswered)
    }

    func testUserChangeChoice() {
        let sut = loadSingleChoiceQuestion()
        sut.selectChoice(at: 0)
        XCTAssertEqual(sut.selectedIndexes, [0])
        XCTAssertTrue(sut.isAnswered)
        sut.selectChoice(at: 2)
        XCTAssertEqual(sut.selectedIndexes, [2])
        XCTAssertTrue(sut.isAnswered)
    }
}
