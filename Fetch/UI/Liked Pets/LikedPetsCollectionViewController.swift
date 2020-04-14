//
//  LikedPetsCollectionViewController.swift
//  Fetch
//
//  Created by Alvin Andino on 4/7/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import UIKit
import Intrepid
import Kingfisher

final class LikedPetsCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    private let viewModel: LikedPetsCollectionViewModel

    init(viewModel: LikedPetsCollectionViewModel = LikedPetsCollectionViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: Self.ip_nibName, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.ip_registerCell(LikedPetsCollectionViewCell.self)
        bindToViewModel()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetchLikedPets()
    }

    private func bindToViewModel() {
        viewModel.updateUI = { [weak self] in
            Main {
                self?.collectionView.reloadData()
            }
        }
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.numberOfSections
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItemsInSection(section)
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: LikedPetsCollectionViewCell = collectionView.ip_dequeueCell(indexPath)
        cell.viewModel = viewModel.viewModel(forCellAt: indexPath)
        return cell
    }
}
