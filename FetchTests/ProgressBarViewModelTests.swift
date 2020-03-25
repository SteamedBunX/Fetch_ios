//
//  ProgressBarViewModelTests.swift
//  FetchTests
//
//  Created by Alvin Andino on 3/25/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import XCTest
import Intrepid
@testable import Fetch

class ProgressBarViewModelTests: XCTestCase {

    var progressBarViewModel: ProgressBarViewModel?

    override func setUp() {
        super.setUp()
        progressBarViewModel = ProgressBarViewModel()
    }

    override func tearDown() {
        super.tearDown()
        progressBarViewModel = nil
    }

    func testUpdatesFromProgression() throws {
        let progressBarViewModel = try XCTUnwrap(self.progressBarViewModel)

        let called = expectation(description: "Function Called")
            .expectedFulfillmentCount(4)
        let notCalled = expectation(description: "Function Not Called")
            .isInverted(true)

        progressBarViewModel.update = {
            notCalled.fulfill()
        }

        progressBarViewModel.return()

        progressBarViewModel.update = {
            called.fulfill()
        }

        progressBarViewModel.progress()
        progressBarViewModel.progress()

        progressBarViewModel.update = {
            notCalled.fulfill()
        }

        progressBarViewModel.progress()

        progressBarViewModel.update = {
            called.fulfill()
        }

        progressBarViewModel.return()
        progressBarViewModel.return()

        waitForExpectations(timeout: 2)
    }

    func testValidIndexes() throws {
        let progressBarViewModel = try XCTUnwrap(self.progressBarViewModel)

        let notCalled = expectation(description: "Function Not Called")
            .isInverted(true)

        progressBarViewModel.update = {
            notCalled.fulfill()
        }

        XCTAssertFalse(progressBarViewModel.isEnabled(atIndex: -1))
        XCTAssert(progressBarViewModel.isEnabled(atIndex: 0))
        XCTAssertFalse(progressBarViewModel.isEnabled(atIndex: 1))
        XCTAssertFalse(progressBarViewModel.isEnabled(atIndex: 2))
        XCTAssertFalse(progressBarViewModel.isEnabled(atIndex: 3))

        waitForExpectations(timeout: 2)
    }
}

extension XCTestExpectation {
    func isInverted(_ isInverted: Bool) -> XCTestExpectation {
        self.isInverted = isInverted
        return self
    }

    func expectedFulfillmentCount(_ expectedFulfillmentCount: Int) -> XCTestExpectation {
        self.expectedFulfillmentCount = expectedFulfillmentCount
        return self
    }
}
