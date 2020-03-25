//
//  ProgressModelTests.swift
//  FetchTests
//
//  Created by Alvin Andino on 3/25/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import XCTest
@testable import Fetch

class ProgressModelTests: XCTestCase {

    private var progressModel: ProgressModel?

    override func setUp() {
        super.setUp()

        do {
            progressModel = try ProgressModel()
        } catch {
            XCTFail("Cannot Initalize ProgressModel: \(error)")
        }
    }

    override func tearDown() {
        super.tearDown()
        progressModel = nil
    }

    func testValidIndexes() throws {
        let progressModel = try XCTUnwrap(self.progressModel)

        XCTAssertEqual(progressModel.validIndexes, 0..<3)
    }

    func testValidValidIndexQueries() throws {
        let progressModel = try XCTUnwrap(self.progressModel)

        assert(
            expression: try progressModel.isWithinProgress(atIndex: -1),
            throwsError: ProgressModelError.invalidRequestedIndex(-1)
        )

        XCTAssertNoThrow(try progressModel.isWithinProgress(atIndex: 0))
        XCTAssertNoThrow(try progressModel.isWithinProgress(atIndex: 1))
        XCTAssertNoThrow(try progressModel.isWithinProgress(atIndex: 2))

        assert(
            expression: try progressModel.isWithinProgress(atIndex: 3),
            throwsError: ProgressModelError.invalidRequestedIndex(3)
        )
    }

    func testValidStartingProgress() throws {
        let progressModel = try XCTUnwrap(self.progressModel)

        XCTAssert(try progressModel.isWithinProgress(atIndex: 0))
        XCTAssertFalse(try progressModel.isWithinProgress(atIndex: 1))
        XCTAssertFalse(try progressModel.isWithinProgress(atIndex: 2))
    }

    func testValidProgression() throws {
        var progressModel = try XCTUnwrap(self.progressModel)

        XCTAssertNoThrow(try progressModel.progress())

        XCTAssert(try progressModel.isWithinProgress(atIndex: 0))
        XCTAssert(try progressModel.isWithinProgress(atIndex: 1))
        XCTAssertFalse(try progressModel.isWithinProgress(atIndex: 2))

        XCTAssertNoThrow(try progressModel.progress())

        XCTAssert(try progressModel.isWithinProgress(atIndex: 0))
        XCTAssert(try progressModel.isWithinProgress(atIndex: 1))
        XCTAssert(try progressModel.isWithinProgress(atIndex: 2))

        assert(
            expression: try progressModel.progress(),
            throwsError: ProgressModelError.cannotProgress
        )

        XCTAssert(try progressModel.isWithinProgress(atIndex: 0))
        XCTAssert(try progressModel.isWithinProgress(atIndex: 1))
        XCTAssert(try progressModel.isWithinProgress(atIndex: 2))
    }

    func testReturnFromEnd() throws {
        var progressModel = try XCTUnwrap(self.progressModel)

        try progressModel.progress()
        try progressModel.progress()

        XCTAssertNoThrow(try progressModel.return())

        XCTAssert(try progressModel.isWithinProgress(atIndex: 0))
        XCTAssert(try progressModel.isWithinProgress(atIndex: 1))
        XCTAssertFalse(try progressModel.isWithinProgress(atIndex: 2))

        XCTAssertNoThrow(try progressModel.return())

        XCTAssert(try progressModel.isWithinProgress(atIndex: 0))
        XCTAssertFalse(try progressModel.isWithinProgress(atIndex: 1))
        XCTAssertFalse(try progressModel.isWithinProgress(atIndex: 2))

        assert(
            expression: try progressModel.return(),
            throwsError: ProgressModelError.cannotReturn
        )

        XCTAssert(try progressModel.isWithinProgress(atIndex: 0))
        XCTAssertFalse(try progressModel.isWithinProgress(atIndex: 1))
        XCTAssertFalse(try progressModel.isWithinProgress(atIndex: 2))
    }

    func testNegativeNumberOfSegments() throws {
          assert(
              expression: try ProgressModel(numberOfSegments: -1),
              throwsError: ProgressModelError.invalidNumberOfSegments(-1)
          )
    }

    func testZeroNumberOfSegments() throws {
          assert(
              expression: try ProgressModel(numberOfSegments: 0),
              throwsError: ProgressModelError.invalidNumberOfSegments(0)
          )
    }

    func testValidumberOfSegments() throws {
        XCTAssertNoThrow(try ProgressModel(numberOfSegments: 1))
    }

    func testNegativeStartingIndex() throws {
          assert(
              expression: try ProgressModel(startingIndex: -1),
              throwsError: ProgressModelError.invalidStartingIndex(-1)
          )
    }

    func testZeroStartingIndex() throws {
        XCTAssertNoThrow(try ProgressModel(startingIndex: 0))
    }

    func testValidSegmentsAndIndex() throws {
        XCTAssertNoThrow(try ProgressModel(numberOfSegments: 5, startingIndex: 4))
    }

    func testSameSegmentsAndIndex() throws {
          assert(
              expression: try ProgressModel(numberOfSegments: 5, startingIndex: 5),
              throwsError: ProgressModelError.invalidStartingIndex(5)
          )
    }

    func testGreaterIndexThanSegments() throws {
          assert(
              expression: try ProgressModel(numberOfSegments: 5, startingIndex: 6),
              throwsError: ProgressModelError.invalidStartingIndex(6)
          )
    }
}

private extension ProgressModelTests {

    func assert<T, U: Equatable & Error>(
        expression: @autoclosure () throws -> T,
        throwsError expected: U,
        message: @autoclosure () -> String = "",
        file: StaticString = #file,
        line: UInt = #line
    ) {
        XCTAssertThrowsError(
            try expression(),
            message(),
            file: file,
            line: line
        ) {
            assert(
                error: $0,
                matches: expected,
                description: message(),
                file: file,
                line: line
            )
        }
    }

    func assert<T: Equatable & Error>(
        error: Error,
        matches expected: T,
        description: @autoclosure () -> String = "",
        file: StaticString = #file,
        line: UInt = #line
    ) {
        return XCTAssertEqual((error as? T), expected, description(), file: file, line: line)
    }
}
