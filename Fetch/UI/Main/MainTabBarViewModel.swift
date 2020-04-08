//
//  MainTabBarViewModel.swift
//  Fetch
//
//  Created by yi.hao on 4/6/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import Foundation

protocol MainTabBarViewModelForChildDelegate: AnyObject {

    func likedCountDidIncrease()
    func likedCountDidDecrease()
}

protocol MainTabBarViewModelDelegate: AnyObject {

    func selectionDidChange(to index: Int)
    func likedCountDidChange()
}

final class MainTabBarViewModel {

    weak var delegate: MainTabBarViewModelDelegate?
    private let networkManager: NetworkManager
    private let homeViewController: HomeViewController
    private var currentLikedCount: Int = 0
    private var likedCountChangesSinceSync: Int = 0
    private(set) var tabItems = [TabItem]()

    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
        let homeViewModel = HomeViewModel(networkManager: networkManager)
        homeViewController = HomeViewController(viewModel: homeViewModel)
        setupTabItems()
    }

    func setupTabItems() {
        tabItems.append(TabItem(icon: #imageLiteral(resourceName: "main_settingTabButton"), isSelected: false, currentNumber: nil))
        tabItems.append(TabItem(icon: #imageLiteral(resourceName: "main_homeTabButton"), isSelected: true, currentNumber: nil))
        tabItems.append(TabItem(icon: #imageLiteral(resourceName: "main_likedTabButton"), isSelected: false, currentNumber: 0))
    }

    func tabTapped(at selectedIndex: Int) {
        // Currently the first Tab aka setting is disabled.
        guard selectedIndex != 0 else {return}
        for index in 0..<tabItems.count {
            if index == selectedIndex {
                tabItems[index].select()
            } else {
                tabItems[index].unSelect()
            }
        }
        delegate?.selectionDidChange(to: selectedIndex)
    }

    func syncLikedCount() {
        networkManager.getLikedCount(forUser: "") { result in
            switch result {
            case .success(let count):
                self.currentLikedCount = count
            case .failure(_):
                break
            }
        }
    }
}

extension MainTabBarViewModel: MainTabBarViewModelForChildDelegate {

    func likedCountDidIncrease() {
        if likedCountChangesSinceSync < 20 {
            currentLikedCount += 1
            likedCountChangesSinceSync += 1
        } else {
            syncLikedCount()
            likedCountChangesSinceSync = 0
        }
        tabItems[2].currentNumber = currentLikedCount
        delegate?.likedCountDidChange()
    }

    func likedCountDidDecrease() {
        if likedCountChangesSinceSync < 20 {
            currentLikedCount = max(currentLikedCount - 1, 0)
            likedCountChangesSinceSync += 1
        } else {
            syncLikedCount()
            likedCountChangesSinceSync = 0
        }
        tabItems[2].currentNumber = currentLikedCount
        delegate?.likedCountDidChange()
    }
}
