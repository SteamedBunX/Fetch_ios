//
//  OnboardingViewModel.swift
//  Fetch
//
//  Created by yi.hao on 3/18/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import Foundation

protocol OnboardingViewModel: AnyObject {

    var delegate: OnboardingViewModelDelegate? { get set }

    var currentSection: Int { get }
    var totalSection: Int { get }
    var sections: [OnboardingSection] { get }
    func select(index: Int)
    func updateInput(currentInput: String)
    func toNextQuestion()
    func toLastQuestion()
}

protocol OnboardingViewModelDelegate: AnyObject {

    func sectionDidChange(currentSection: Int)
    func questionDidChange(currentQuestion: OnboardingQuestion?)
    func selectionDidChange(selected: [Int])
    func onboardingComplete()
}
