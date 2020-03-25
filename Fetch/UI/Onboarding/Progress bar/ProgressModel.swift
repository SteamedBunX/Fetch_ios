//
//  ProgressModel.swift
//  Fetch
//
//  Created by Alvin Andino on 3/25/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import Foundation

enum ProgressModelError: Error, CustomStringConvertible, Equatable {
    case invalidNumberOfSegments(Int)
    case invalidStartingIndex(Int)
    case invalidRequestedIndex(Int)
    case cannotProgress
    case cannotReturn

    var description: String {
        switch self {
        case .invalidNumberOfSegments(let value):
            return "Invalid Argument for NumberOfSegments: \(value)"
        case .invalidStartingIndex(let value):
            return "Invalid Argument for StartingIndex: \(value)"
        case .invalidRequestedIndex(let value):
            return "Invalid Argument for RequestedIndex: \(value)"
        case .cannotProgress:
            return "Cannot Progress Further"
        case .cannotReturn:
            return "Cannot Return Further"
        }
    }
}

struct ProgressModel {

    var validIndexes: Range<Int> {
        return 0..<numberOfSegments
    }

    private let numberOfSegments: Int
    private var currentIndex: Int

    private var canProgress: Bool {
        return (currentIndex + 1) < numberOfSegments
    }

    private var canReturn: Bool {
        return (currentIndex - 1) >= 0
    }

    init(numberOfSegments: Int = 3, startingIndex: Int = 0) throws {

        currentIndex = startingIndex
        self.numberOfSegments = numberOfSegments

        guard isValid(numberOfSegments: numberOfSegments) else {
            throw ProgressModelError.invalidNumberOfSegments(numberOfSegments)
        }

        guard isValid(requestedIndex: startingIndex) else {
            throw ProgressModelError.invalidStartingIndex(startingIndex)
        }
    }

    mutating func progress() throws {
        guard canProgress else {
            throw ProgressModelError.cannotProgress
        }

        incrementIndex()
    }

    mutating func `return`() throws {
        guard canReturn else {
            throw ProgressModelError.cannotReturn
        }

        decrementIndex()
    }

    func isWithinProgress(atIndex index: Int) throws -> Bool {
        guard isValid(requestedIndex: index) else {
            throw ProgressModelError.invalidRequestedIndex(index)
        }

        return checkIsWithinProgress(atIndex: index)
    }

    private func isValid(requestedIndex index: Int) -> Bool {
        return index >= 0 && index < numberOfSegments
    }

    private func isValid(numberOfSegments segments: Int) -> Bool {
        return segments > 0
    }

    private func checkIsWithinProgress(atIndex index: Int) -> Bool {
        return index <= currentIndex
    }

    private mutating func incrementIndex() {
        currentIndex += 1
    }

    private mutating func decrementIndex() {
        currentIndex -= 1
    }
}
