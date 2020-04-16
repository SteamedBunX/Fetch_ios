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

    static let cellIdentifier = "AnswerChoiceCell"

    @IBOutlet private var answerChoiceButton: RoundButton!

    weak var delegate: AnswerChoiceCellDelegate?
    private var answerIndex: Int = 0

    func setup(index: Int, answer: String, selected: Bool) {
        answerIndex = index
        answerChoiceButton.setTitle(answer, for: .normal)
        answerChoiceButton.layer.applyAnswerChoiceButtonShadow()
        answerChoiceButton.backgroundColor = selected ? .answerChoiceButtonSelected : .answerChoiceButtonUnSelected
        answerChoiceButton.setTitleColor(selected ? .white : .black, for: .normal)
        answerChoiceButton.titleLabel?.font = selected ? UIFont(name: "Lato-Bold", size: 16.0) : UIFont(name: "Lato-Regular", size: 16.0)
    }

    @IBAction private func buttonTapped(_ sender: Any) {
        delegate?.buttonTapped(at: answerIndex)
    }
}
