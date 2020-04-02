//
//  CardView.swift
//  Fetch
//
//  Created by yi.hao on 4/2/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import UIKit

@IBDesignable class CardView: UIView {

    // MARK: - Clipping
    @IBInspectable var shouldClip: Bool = false

    // MARK: - Shadow
    @IBInspectable var shadowColor: UIColor = UIColor.black
    @IBInspectable var shadowOpacity: Float = 0
    @IBInspectable var shadowBlur: CGFloat = 0
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0, height: 0)

    // MARK: - Round Corner
    @IBInspectable var cornerRadius: CGFloat = 0

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.styleView()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.styleView()
    }

    func styleView() {
        layer.cornerRadius = cornerRadius
        layer.applyShadowWith(color: shadowColor, alpha: shadowOpacity, xOffset: shadowOffset.width, yOffset: shadowOffset.height, blur: shadowBlur)
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowBlur
        layer.shadowOffset = shadowOffset
        clipsToBounds = shouldClip
    }

}
