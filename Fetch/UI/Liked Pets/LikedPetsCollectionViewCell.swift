//
//  LikedPetsCollectionViewCell.swift
//  Fetch
//
//  Created by Alvin Andino on 4/9/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import UIKit
import Kingfisher

final class LikedPetsCollectionViewCell: UICollectionViewCell {

    @IBOutlet private var profileImageView: UIImageView!
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var distanceLabel: UILabel!
    @IBOutlet private var ageLabel: UILabel!
    @IBOutlet private var sizeLabel: UILabel!

    var viewModel: LikedPetsCollectionViewCellViewModel = PlaceHolderLikedPetsCollectionViewCellViewModel() {
        didSet {
            bindToViewModel()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.masksToBounds = false
        profileImageView.kf.indicatorType = .activity
        bindToViewModel()
    }

    private func bindToViewModel() {
        profileImageView.kf.setImage(
            with: viewModel.imageURL,
            placeholder: viewModel.placeHolderImage,
            options: [.transition(.fade(1))]
        )
        nameLabel.text = viewModel.name
        distanceLabel.text = viewModel.distance
        ageLabel.text = viewModel.age
        sizeLabel.text = viewModel.size
    }
}
