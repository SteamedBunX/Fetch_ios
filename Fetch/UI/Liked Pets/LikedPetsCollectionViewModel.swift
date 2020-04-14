//
//  LikedPetsCollectionViewModel.swift
//  Fetch
//
//  Created by Alvin Andino on 4/10/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import Foundation

final class LikedPetsCollectionViewModel {
    let numberOfSections = 1

    var updateUI: (() -> ())?

    private var likedPetViewModels: [LikedPetsCollectionViewCellViewModel] = [] {
        didSet {
            updateUI?()
        }
    }

    private let networkManager: NetworkManager
    private let factory: LikedPetsCollectionViewCellViewModelFactory

    init(
        networkManager: NetworkManager = MockNetworkManager(),
        factory: LikedPetsCollectionViewCellViewModelFactory = LikedPetsCollectionViewCellViewModelFactory()
    ) {
        self.networkManager = networkManager
        self.factory = factory
    }

    func numberOfItemsInSection(_ section: Int) -> Int {
        guard section == 0 else {
            return 0
        }

        return likedPetViewModels.count
    }

    func viewModel(forCellAt indexPath: IndexPath) -> LikedPetsCollectionViewCellViewModel {
        guard indexPath.section == 0 else {
            return factory.defaultViewModel
        }

        return likedPetViewModels[ip_safely: indexPath.item] ?? factory.defaultViewModel
    }

    func fetchLikedPets() {
        networkManager.getLikedPets { [weak self] result in
            guard let strongSelf = self else {
                return
            }

            switch result {
            case .success(let pets):
                strongSelf.setViewModels(fromPets: pets)
            case .failure(let error):
                print("Error fetching liked pets: \(error)")
            }
        }
    }

    private func setViewModels(fromPets pets: [Pet]) {
        likedPetViewModels = pets.map(factory.viewModel(forPet:))
    }
}

struct LikedPetsCollectionViewCellViewModelFactory {
    var defaultViewModel: LikedPetsCollectionViewCellViewModel {
        return LikedPetsCollectionViewCellViewModel()
    }

    func viewModel(forPet pet: Pet) -> LikedPetsCollectionViewCellViewModel {
        let profile = pet.card
        return LikedPetsCollectionViewCellViewModel(
            imageURLString: profile.photoURLs.first ?? "",
            placeHolderImage: #imageLiteral(resourceName: "main_noPictureIcon"),
            name: profile.name,
            distance: "10 mi away",
            age: profile.age,
            size: profile.size
        )
    }
}
