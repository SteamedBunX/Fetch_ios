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

    weak var delegate: AnswerChoiceCellDelegate?
    private var answerIndex: Int = 0

    func setup(index: Int, answer: String, selected: Bool) {
        answerIndex = index
        answerChoiceButton.setTitle(answer, for: .normal)
        answerChoiceButton.layer.applyAnswerChoiceButtonShadow()
        answerChoiceButton.backgroundColor = selected ? .answerChoiceButtonSelected : .white
        answerChoiceButton.setTitleColor(selected ? .white : .darkText, for: .normal)
    }

    @IBAction private func buttonTapped(_ sender: Any) {
        delegate?.buttonTapped(at: answerIndex)
    }
}
