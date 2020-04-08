//
//  MainTabBarViewController.swift
//  Fetch
//
//  Created by yi.hao on 4/6/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import UIKit

class MainTabBarViewController: UIViewController {

    weak var coordinator: MainCoordinator?
    private let viewModel: MainTabBarViewModel
    private var currentViewController: UIViewController?
    var homeViewController: HomeViewController?
    var likedPetViewController: UIViewController?

    @IBOutlet private var frameView: UIView!
    @IBOutlet var tabBarCollectionView: UICollectionView!
    @IBOutlet var tabBarFrameView: UIView!

    init (viewModel: MainTabBarViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "MainTabBarViewController", bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        setupViewControllers()
        moveTo(viewController: homeViewController)
    }

    private func setupViewControllers() {
        if let homeViewController = homeViewController {
            addChild(homeViewController)
        }
    }

    private func setupTabBar() {
        tabBarFrameView.layer.applyTabBarShadow()
        view.bringSubviewToFront(tabBarFrameView)
    }

    // MARK: - View Control

    func moveTo(viewController: UIViewController?) {
        guard currentViewController !== viewController else {return}
        if let viewController = viewController {
            currentViewController?.view.removeFromSuperview()
            viewController.view.frame = frameView.bounds
            viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            frameView.addSubview(viewController.view)
            currentViewController = viewController
        }
    }
}

extension MainTabBarViewController: MainTabBarViewModelDelegate {
    func selectionDidChange(to index: Int) {

    }

    func likedCountDidChange(to count: Int) {

    }
}

extension MainTabBarViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 4, height: collectionView.frame.height)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}
