//
//  MainTabBarViewModel.swift
//  Fetch
//
//  Created by yi.hao on 4/6/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import Foundation
import Intrepid

protocol MainTabBarViewModelForChildDelegate: AnyObject {

    func likedCountDidIncrease()
    func likedCountDidDecrease()
}

protocol MainTabBarViewModelDelegate: AnyObject {

    func tabSelectionDidChange(to option: TabBarItemOption)
    func likedCountDidChange()
}

final class MainTabBarViewModel {

    weak var delegate: MainTabBarViewModelDelegate?
    private let networkManager: NetworkManager
    private let maxLikedCountChangeBeforeSync = 20
    private var likedCountChangesSinceSync: Int = 0
    private(set) var tabBarItems = [TabBarItem]()

    private var currentLikedCount: Int = 0 {
        didSet {
            tabBarItems[TabBarItemOption.liked.rawValue].currentNumber = currentLikedCount
            delegate?.likedCountDidChange()
        }
    }

    lazy var homeViewModel: HomeViewModel = {
        return HomeViewModel(networkManager: networkManager)
    }()

    lazy var likedPetsViewModel: LikedPetsCollectionViewModel = {
        return LikedPetsCollectionViewModel(networkManager: networkManager)
    }()

    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
        setupTabItems()
    }

    private func setupTabItems() {
        tabBarItems.append(TabBarItem(icon: TabBarItemOption.setting.icon, isSelected: false, currentNumber: nil, option: .setting))
        tabBarItems.append(TabBarItem(icon: TabBarItemOption.home.icon, isSelected: true, currentNumber: nil, option: .home))
        tabBarItems.append(TabBarItem(icon: TabBarItemOption.liked.icon, isSelected: false, currentNumber: 0, option: .liked))
        syncLikedCount()
    }

    func getTabBarItem(at index: Int) -> TabBarItem? {
        return tabBarItems[ip_safely: index]
    }

    func tabTapped(at selectedIndex: Int) {
        // Currently the first Tab aka setting is disabled.
        guard selectedIndex != 0 else { return }
        for index in 0..<tabBarItems.count {
            if index == selectedIndex {
                tabBarItems[index].isSelected = true
            } else {
                tabBarItems[index].isSelected = false
            }
        }
        delegate?.tabSelectionDidChange(to: tabBarItems[selectedIndex].option)
    }

    private func syncLikedCount() {
        networkManager.getLikedCount { [weak self] result in
            switch result {
            case .success(let count):
                self?.currentLikedCount = count
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension MainTabBarViewModel: MainTabBarViewModelForChildDelegate {

    func likedCountDidIncrease() {
        if likedCountChangesSinceSync < maxLikedCountChangeBeforeSync {
            currentLikedCount += 1
            likedCountChangesSinceSync += 1
        } else {
            currentLikedCount += 1
            syncLikedCount()
            likedCountChangesSinceSync = 0
        }
    }

    func likedCountDidDecrease() {
        if likedCountChangesSinceSync < maxLikedCountChangeBeforeSync {
            currentLikedCount = max(currentLikedCount - 1, 0)
            likedCountChangesSinceSync += 1
        } else {
            syncLikedCount()
            likedCountChangesSinceSync = 0
        }
    }
}
