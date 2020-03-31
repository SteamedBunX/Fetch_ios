//
//  ProgressBarViewModel.swift
//  Fetch
//
//  Created by Alvin Andino on 3/24/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import Foundation

protocol ProgressBarViewModel: AnyObject {
    var updateProgressBar: (() -> ())? { get set }
    var numberOfSegments: Int { get }
    var currentIndex: Int { get }
    var isProgressFilled: Bool { get }
}

extension ProgressBarViewModel {
    var isProgressFilled: Bool {
        return true
    }
}
