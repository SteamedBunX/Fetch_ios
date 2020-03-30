//
//  QuestionChoiceCell.swift
//  Fetch
//
//  Created by yi.hao on 3/30/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import Foundation
import UIKit

protocol AnswerChoiceCellDelegate: AnyObject {
    func buttonTapped(at index: Int)
}

final class AnswerChoiceCell: UITableViewCell {

    @IBOutlet private var answerChoiceButton: CustomRoundSidedUIButton!

    private weak var delegate: AnswerChoiceCellDelegate?
    private var answerIndex: Int = 0

    func setup(index: Int, answer: String, selected: Bool) {
        answerIndex = index
        answerChoiceButton.setTitle(answer, for: .normal)
        answerChoiceButton.layer.applyAnswerChoiceButtonShadow()
        if selected {
            answerChoiceButton.backgroundColor = .answerChoiceButtonSelected
            answerChoiceButton.setTitleColor(.white, for: .normal)
        } else {
            answerChoiceButton.backgroundColor = .white
            answerChoiceButton.setTitleColor(.darkText, for: .normal)
        }
    }

    func setDelegate(_ delegate: AnswerChoiceCellDelegate) {
        self.delegate = delegate
    }

    @IBAction private func buttonTapped(_ sender: Any) {
        delegate?.buttonTapped(at: answerIndex)
    }
}
