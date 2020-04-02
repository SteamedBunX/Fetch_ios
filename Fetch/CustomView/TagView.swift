//
//  tagView.swift
//  Fetch
//
//  Created by yi.hao on 4/2/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import UIKit

@IBDesignable class TagView: UIView {

    // MARK: - Shadow
    @IBInspectable var tagImage: UIImage?
    @IBInspectable var tagContent: String?
    @IBInspectable var tagColor: UIColor = .black
    var width: CGFloat = 0
    var height: CGFloat = 32

    override var intrinsicContentSize: CGSize {
        return CGSize(width: width, height: height)
    }

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        styleView()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        styleView()
    }

    func styleView() {
        width = 20
        let icon = UIImageView()
        addSubview(icon)
        if let tagImage = tagImage {
            icon.image = tagImage
            icon.heightAnchor.constraint(equalToConstant: 32).isActive = true
            icon.widthAnchor.constraint(equalToConstant: 32).isActive = true
        }
        icon.topAnchor.constraint(equalTo: topAnchor).isActive = true
        icon.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        icon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4).isActive = true
        icon.translatesAutoresizingMaskIntoConstraints = false
        width += icon.frameX
        let content = UILabel()
        addSubview(content)
        content.text = tagContent?.capitalized
        content.font = UIFont(name: "Lato", size: 12)
        content.textColor = tagColor
        content.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 3).isActive = true
        content.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        content.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        content.translatesAutoresizingMaskIntoConstraints = false
        width += content.frameX

        layer.cornerRadius = frame.size.height / 2
        layer.borderColor = tagColor.cgColor
        layer.borderWidth = 2
        invalidateIntrinsicContentSize()
    }

}
