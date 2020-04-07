//
//  MainTabBarViewController.swift
//  Fetch
//
//  Created by yi.hao on 4/6/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    weak var coordinator: MainCoordinator?
    private let viewModel: MainTabBarViewModel

    @IBOutlet private var frameView: UIView!
    @IBOutlet var tabBarCollectionView: UICollectionView!
    
    init (viewModel: MainTabBarViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "MainTabBarViewController", bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // MARK: - View Control

    func moveTo(viewController: UIViewController) {
        
    }
}

extension MainTabBarViewController: MainTabBarViewModelDelegate {
    func selectionDidChange(to index: Int) {

    }

    func likedCountDidChange(to count: Int) {

    }
}

extension MainTabBarViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}
