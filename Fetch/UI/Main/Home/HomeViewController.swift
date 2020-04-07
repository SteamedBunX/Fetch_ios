//
//  HomeViewController.swift
//  Fetch
//
//  Created by yi.hao on 4/2/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher
import Intrepid

final class HomeViewController: UIViewController {

    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var statusLabel: UILabel!
    @IBOutlet private var photoImageView: UIImageView!
    @IBOutlet private var tagViews: [TagView]!

    weak var coordinator: MainCoordinator?
    private let viewModel: HomeViewModel

    private let totalTagViewAvailable = 4

    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "HomeViewController", bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.loadFirstBatch()
        if !shouldDisplayNewPet(liked: true) {
            // TODO: show the empty state
        }
    }

    private func shouldDisplayNewPet(liked: Bool) -> Bool {
        guard viewModel.currentPetIsAvaliable else {
            return false
        }
        nameLabel.text = viewModel.currentPetName
        statusLabel.text = viewModel.currentPetStatus
        updatePetTags()
        updatePetImage()
        return true
    }

    func updatePetTags() {
        var currentTagIndex = 0
        PetTagType.allCases.forEach { tag in
            if let petTag = viewModel.currentPetTags[tag] {
                let currentTagView = tagViews[ip_safely: currentTagIndex]
                currentTagView?.isHidden = false
                currentTagView?.reloadTag(withIcon: tag.icon, tint: tag.color, content: petTag)
                currentTagIndex += 1
            }
        }
        while currentTagIndex < totalTagViewAvailable {
            tagViews[ip_safely: currentTagIndex]?.isHidden = true
        }
    }

    func updatePetImage() {
        if let urlString = viewModel.currentPetPhotoURLs.first {
            let url = URL(string: urlString)
            photoImageView.kf.setImage(with: url, placeholder: viewModel.imagePlaceHolder)
        } else {
            photoImageView.image = viewModel.imagePlaceHolder
        }
    }

    // MARK: - Button Actions

    @IBAction private func unlikeButtonTapped(_ sender: Any) {
        viewModel.unlikeButtonTapped()
    }

    @IBAction private func likeButtonTapped(_ sender: Any) {
        viewModel.likeButtonTapped()
    }
}

extension HomeViewController: HomeViewModelDelegate {

    func didLikePet(_ liked: Bool) {
        if !shouldDisplayNewPet(liked: liked) {
            // TODO: Display empty state
        }
    }

    func cacheImage(from url: String) {
        guard let url = URL(string: url) else {return}
        KingfisherManager.shared.retrieveImage(with: url) { _ in }
    }
}
