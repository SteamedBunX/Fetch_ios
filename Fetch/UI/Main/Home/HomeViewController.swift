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

    weak var coordinator: MainCoordinator?
    private let viewModel: HomeViewModel

    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var statusLabel: UILabel!
    @IBOutlet private var photoImageView: UIImageView!
    @IBOutlet var tagViews: [TagView]!

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
        if viewModel.currentPetIsAvaliable {
            displayNewPet(liked: true)
        }
    }

    private func displayNewPet(liked: Bool) {
        if viewModel.currentPetIsAvaliable {
            nameLabel.text = viewModel.currentPetName
            statusLabel.text = viewModel.currentPetStatus
            var currentTagIndex = 0
            PetTagType.allCases.forEach { tag in
                if let petTag = viewModel.currentPetTags[tag] {
                    let currentTagView = tagViews[ip_safely: currentTagIndex]
                    currentTagView?.isHidden = false
                    currentTagView?.tagImage = tag.icon
                    currentTagView?.tagColor = tag.color
                    currentTagView?.tagContent = petTag
                    currentTagIndex += 1
                }
            }
            while currentTagIndex < 4 {
                tagViews[ip_safely: currentTagIndex]?.isHidden = true
            }
            guard let urlString = viewModel.currentPetPhotoURLs[ip_safely: 0] else {
                photoImageView.image = viewModel.imagePlaceHolder
                return
            }
            let url = URL(string: urlString)
            photoImageView.kf.setImage(with: url, placeholder: viewModel.imagePlaceHolder)
        }
    }

    // MARK: - Button Actions

    @IBAction func unlikeButtonTapped(_ sender: Any) {
        viewModel.unlikeButtonTapped()
    }

    @IBAction func likeButtonTapped(_ sender: Any) {
        viewModel.likeButtonTapped()
    }
}

extension HomeViewController: HomeViewModelDelegate {

    func didLikePet(_ liked: Bool) {
        if viewModel.currentPetIsAvaliable {
            displayNewPet(liked: liked)
        } else {

        }
    }

    func newImageNeedToCache(from url: String) {
        guard let url = URL(string: url) else {return}
        KingfisherManager.shared.retrieveImage(with: url) { _ in }
    }
}
