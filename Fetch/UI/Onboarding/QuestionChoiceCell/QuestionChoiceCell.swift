//
//  QuestionChoiceCell.swift
//  Fetch
//
//  Created by yi.hao on 3/30/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import Foundation
import UIKit

class QuestionChoiceCell: UITableViewCell {

    @IBOutlet private var questionCheckButton: CustomRoundSidedUIButton!

    var questionIndex: Int = 0

    func setup(index: Int, answer: String, selected: Bool) {
        questionCheckButton.layer.applyGoogleSignInButtonShadow()
        if selected {
            questionCheckButton.backgroundColor = .questionButtonSelectedColor
        } else {
            questionCheckButton.backgroundColor = .white
        }
    }
}
