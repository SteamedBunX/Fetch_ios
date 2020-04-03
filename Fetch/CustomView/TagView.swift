//
//  tagView.swift
//  Fetch
//
//  Created by yi.hao on 4/2/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import UIKit

@IBDesignable class TagView: UIView {

    let icon = UIImageView()
    let content = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(content)
        addSubview(icon)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubview(content)
        addSubview(icon)
    }

    private func sharedInit() {

    }
    // MARK: - Shadow
    @IBInspectable var tagImage: UIImage? {
        didSet {
            setupIcon(tagImage)
            layoutIfNeeded()
        }}

    @IBInspectable var tagContent: String? {
        didSet {
            setupContent(tagContent)
            layoutIfNeeded()
        }}

    @IBInspectable var tagColor: UIColor = .black {
        didSet {
            setupColor(tagColor)
        }}

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

    override func layoutSubviews() {
        super.layoutSubviews()
        setupBorder()
    }

    func styleView() {
        width = 20
        setupIcon(tagImage)
        setupContent(tagContent)
        setupColor(tagColor)
        invalidateIntrinsicContentSize()
    }

    private func setupIcon(_ tagImage: UIImage?) {
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
    }

    private func setupContent(_ tagContent: String?) {
        content.text = tagContent?.capitalized
        content.font = UIFont(name: "Lato", size: 12)

        content.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 3).isActive = true
        content.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        content.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        content.translatesAutoresizingMaskIntoConstraints = false
        width += content.frameX
    }

    private func setupColor(_ tagColor: UIColor) {
        content.textColor = tagColor
        layer.borderColor = tagColor.cgColor
    }

    private func setupBorder() {
        layer.cornerRadius = frame.size.height / 2
        layer.borderWidth = 0.8
    }
}
