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
    @IBOutlet private var tabBarCollectionView: UICollectionView!
    @IBOutlet private var tabBarFrameView: UIView!

    init (viewModel: MainTabBarViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "MainTabBarViewController", bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        setupTabBar()
        setupViewControllers()
        moveTo(viewController: homeViewController)
    }

    private func setupViewControllers() {
        if let homeViewController = homeViewController {
            addChild(homeViewController)
        }
        if let likedPetViewController = likedPetViewController {
            addChild(likedPetViewController)
        }
    }

    private func setupTabBar() {
        tabBarCollectionView.delegate = self
        tabBarCollectionView.dataSource = self
        let nib = UINib(nibName: TabCell.cellIdentifier, bundle: nil)
        tabBarCollectionView.register(nib, forCellWithReuseIdentifier: TabCell.cellIdentifier)
        tabBarFrameView.layer.applyTabBarShadow()
        view.bringSubviewToFront(tabBarFrameView)
    }

    // MARK: - View Control

    private func moveTo(viewController: UIViewController?) {
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
        tabBarCollectionView.reloadData()
        switch index {
        case 1:
            moveTo(viewController: homeViewController)
        case 2:
            moveTo(viewController: likedPetViewController)
        default:
            break
        }
    }

    func likedCountDidChange() {
        tabBarCollectionView.reloadData()
    }
}

extension MainTabBarViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.tabTapped(at: indexPath.row)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 4, height: collectionView.frame.height)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = tabBarCollectionView.dequeueReusableCell(withReuseIdentifier: TabCell.cellIdentifier, for: indexPath) as? TabCell else {
            return UICollectionViewCell()
        }
        guard let cellInfo = viewModel.tabItems[ip_safely: indexPath.row] else {
            return UICollectionViewCell()
        }
        cell.setup(icon: cellInfo.icon, currentNumber: cellInfo.currentNumber, selected: cellInfo.isSelected)
        return cell
    }
}
