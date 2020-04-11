//
//  CircleView.swift
//  Fetch
//
//  Created by Alvin Andino on 4/9/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import UIKit

class CircleView: UIView {
    @IBInspectable var borderWidth: CGFloat = 1.0
    @IBInspectable var borderInset: CGFloat = 0.5
    @IBInspectable var borderColor: UIColor = .black

    override func draw(_ rect: CGRect) {
        let borderPath = UIBezierPath(ovalIn: rect.insetBy(dx: borderInset, dy: borderInset))
        borderPath.lineWidth = borderWidth
        borderColor.setStroke()
        borderPath.stroke()
    }
}
