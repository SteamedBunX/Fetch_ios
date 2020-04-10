//
//  MainTabBarViewController.swift
//  Fetch
//
//  Created by yi.hao on 4/6/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import UIKit

final class MainTabBarViewController: UIViewController {

    private let viewModel: MainTabBarViewModel
    private var currentViewController: UIViewController?
    private let homeViewController: HomeViewController
    private let likedPetViewController: UIViewController

    @IBOutlet private var frameView: UIView!
    @IBOutlet private var tabBarCollectionView: UICollectionView!
    @IBOutlet private var tabBarFrameView: UIView!

    init(viewModel: MainTabBarViewModel) {
        self.viewModel = viewModel
        let homeViewModel = viewModel.homeViewModel
        homeViewModel.tabBarDelegate = viewModel
        homeViewController = HomeViewController(viewModel: homeViewModel)
        likedPetViewController = UIViewController()
        likedPetViewController.view.backgroundColor = .blue
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
        addChild(homeViewController)
        addChild(likedPetViewController)
    }

    private func setupTabBar() {
        tabBarCollectionView.delegate = self
        tabBarCollectionView.dataSource = self
        let nib = UINib(nibName: TabBarCell.cellIdentifier, bundle: nil)
        tabBarCollectionView.register(nib, forCellWithReuseIdentifier: TabBarCell.cellIdentifier)
        tabBarFrameView.layer.applyTabBarShadow()
        view.bringSubviewToFront(tabBarFrameView)
    }

    // MARK: - View Control

    private func moveTo(viewController: UIViewController) {
        guard currentViewController !== viewController else { return }
        currentViewController?.view.removeFromSuperview()
        viewController.view.frame = frameView.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        frameView.addSubview(viewController.view)
        currentViewController = viewController
    }
}

extension MainTabBarViewController: MainTabBarViewModelDelegate {
    func tabSelectionDidChange(to option: TabBarItemOption) {
        tabBarCollectionView.reloadData()
        switch option {
        case TabBarItemOption.home:
            moveTo(viewController: homeViewController)
        case TabBarItemOption.liked:
            moveTo(viewController: likedPetViewController)
        default:
            break
        }
    }

    func likedCountDidChange() {
        tabBarCollectionView.reloadItems(at: [IndexPath(row: TabBarItemOption.liked.rawValue, section: 0)])
    }
}

extension MainTabBarViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.tabBarItems.count
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
        guard let cell = tabBarCollectionView.dequeueReusableCell(withReuseIdentifier: TabBarCell.cellIdentifier, for: indexPath) as? TabBarCell,
              let cellInfo = viewModel.getTabBarItem(at: indexPath.row)
              else { return UICollectionViewCell() }
        cell.setup(item: cellInfo)
        return cell
    }
}
