//
//  CardView.swift
//  Fetch
//
//  Created by yi.hao on 4/2/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import UIKit

@IBDesignable class CardView: UIView {

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

    override func layoutSubviews() {
        super.layoutSubviews()
        subviews.forEach { subview in
            let maskLayer = CALayer()
            maskLayer.cornerRadius = cornerRadius
            maskLayer.frame.size = frame.size
            maskLayer.frame.origin = convert(CGPoint(x: 0, y: 0), to: subview)
            maskLayer.backgroundColor = UIColor.white.cgColor
            subview.layer.mask = maskLayer
        }
    }

    func styleView() {
        setupView()
    }

    func setupView() {
        layer.cornerRadius = cornerRadius
        layer.applyShadowWith(color: shadowColor, alpha: shadowOpacity, xOffset: shadowOffset.width, yOffset: shadowOffset.height, blur: shadowBlur)
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowBlur
        layer.shadowOffset = shadowOffset
        layer.masksToBounds = false
    }
}
