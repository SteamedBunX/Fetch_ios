//
//  MainTabBarViewModel.swift
//  Fetch
//
//  Created by yi.hao on 4/6/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import Foundation

protocol MainTabBarViewModelForChildDelegate: AnyObject {

    func likedCountDidChange(to count: Int)
}

protocol MainTabBarViewModelDelegate: AnyObject {

    func selectionDidChange(to index: Int)
}

final class MainTabBarViewModel {

    weak var delegate: MainTabBarViewModelDelegate?
    private let networkManager: NetworkManager
    private let homeViewController: HomeViewController
    private var currentLikedCount: Int = 0
    private var likedCountChangesSinceSync: Int = 0

    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
        let homeViewModel = HomeViewModel(networkManager: networkManager)
        homeViewController = HomeViewController(viewModel: homeViewModel)
    }

    func tabTapped(at index: Int) {
        delegate?.selectionDidChange(to: index)
    }

    func likedCountDidChange(to count: Int) {

    }

    func likedCountDidIncrease() {
        currentLikedCount += 1
    }

    func likedCountDidDecrease() {
        currentLikedCount -= 1
    }

    func syncLikedCount() {

    }
}
