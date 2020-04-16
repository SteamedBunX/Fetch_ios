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

    func didLike(pet: Pet)
    func didDislike(pet: Pet)
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

    private var currentLikedPets: [LikedPet] = [LikedPet]() {
        didSet {
            tabBarItems[TabBarItemOption.liked.rawValue].currentNumber = currentLikedCount
            likedPetsViewModel.set(likedPets: currentLikedPets)
            delegate?.likedCountDidChange()

        }
    }

    private var currentLikedCount: Int {
        return currentLikedPets.count
    }

    lazy var homeViewModel: HomeViewModel = {
        return HomeViewModel(networkManager: networkManager)
    }()

    lazy var likedPetsViewModel: LikedPetsCollectionViewModel = {
        return LikedPetsCollectionViewModel()
    }()

    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
        setupTabItems()
    }

    private func setupTabItems() {
        tabBarItems.append(TabBarItem(icon: TabBarItemOption.setting.icon, isSelected: false, currentNumber: nil, option: .setting))
        tabBarItems.append(TabBarItem(icon: TabBarItemOption.home.icon, isSelected: true, currentNumber: nil, option: .home))
        tabBarItems.append(TabBarItem(icon: TabBarItemOption.liked.icon, isSelected: false, currentNumber: 0, option: .liked))
        syncLikedPets()
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

    private func syncLikedPets() {
        networkManager.getLikedPets { [weak self] result in
            switch result {
            case .success(let pets):
                self?.currentLikedPets = pets
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension MainTabBarViewModel: MainTabBarViewModelForChildDelegate {

    func didLike(pet: Pet) {
        currentLikedPets.append(pet)

        if likedCountChangesSinceSync < maxLikedCountChangeBeforeSync {
            likedCountChangesSinceSync += 1
        } else {
            syncLikedPets()
            likedCountChangesSinceSync = 0
        }
    }

    func didDislike(pet: Pet) {
        currentLikedPets.removeAll(where: { $0.id == pet.id })
        if likedCountChangesSinceSync < maxLikedCountChangeBeforeSync {
            likedCountChangesSinceSync += 1
        } else {
            syncLikedPets()
            likedCountChangesSinceSync = 0
        }
    }
}
