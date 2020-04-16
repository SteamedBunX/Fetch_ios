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

    private let factory: LikedPetsCollectionViewCellViewModelFactory

    init(
        factory: LikedPetsCollectionViewCellViewModelFactory = LikedPetsCollectionViewCellViewModelFactory()
    ) {
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

    func set(likedPets: [LikedPet]) {
        setViewModels(fromPets: likedPets)
    }

    private func setViewModels(fromPets pets: [LikedPet]) {
        likedPetViewModels = pets.map(factory.viewModel(forPet:))
    }
}

struct LikedPetsCollectionViewCellViewModelFactory {
    var defaultViewModel: LikedPetsCollectionViewCellViewModel {
        return LikedPetsCollectionViewCellViewModel()
    }

    func viewModel(forPet pet: LikedPet) -> LikedPetsCollectionViewCellViewModel {
        return LikedPetsCollectionViewCellViewModel(
            imageURLString: pet.photoURLs.first ?? "",
            placeHolderImage: #imageLiteral(resourceName: "main_noPictureIcon"),
            name: pet.petName,
            distance: "\(pet.distance) mi away",
            age: pet.petAge,
            size: pet.petSize
        )
    }
}
