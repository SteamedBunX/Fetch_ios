//
//  ProgressBarViewModel.swift
//  Fetch
//
//  Created by Alvin Andino on 3/24/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import Foundation

final class ProgressBarViewModel {

    var update: (() -> ())?

    var validIndexes: Range<Int> {
        return progressModel.validIndexes
    }

    private var progressModel: ProgressModel

    // swiftlint:disable force_try
    init(progressModel: ProgressModel = try! ProgressModel()) {
        self.progressModel = progressModel
    }

    func progress() {
        do {
            try progressModel.progress()
            update?()
        } catch {
            print("Error: \(error) thrown. Doing nothing as default")
        }
    }

    func `return`() {
        do {
            try progressModel.return()
            update?()
        } catch {
            print("Error: \(error) thrown. Doing nothing as default")
        }
    }

    func isEnabled(atIndex index: Int) -> Bool {
        do {
            return try progressModel.isWithinProgress(atIndex: index)
        } catch {
            print("Error: \(error) thrown. Returning false as default")
            return false
        }
    }
}
