//
//  QuestionChoiceCell.swift
//  Fetch
//
//  Created by yi.hao on 3/30/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import Foundation
import UIKit

class AnswerChoiceCell: UITableViewCell {

    @IBOutlet private var answerChoiceButton: CustomRoundSidedUIButton!

    var answerIndex: Int = 0

    func setup(index: Int, answer: String, selected: Bool) {
        answerIndex = index
        answerChoiceButton.layer.applyGoogleSignInButtonShadow()
        if selected {
            answerChoiceButton.backgroundColor = .answerChoiceButtonSelected
            answerChoiceButton.titleLabel?.textColor = .white
        } else {
            answerChoiceButton.backgroundColor = .white
            answerChoiceButton.titleLabel?.textColor = .darkText
        }
    }
}
