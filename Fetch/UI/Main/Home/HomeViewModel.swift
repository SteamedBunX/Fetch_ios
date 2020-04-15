//
//  HomeViewModel.swift
//  Fetch
//
//  Created by yi.hao on 4/1/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import Foundation
import UIKit

protocol HomeViewModelDelegate: AnyObject {
    func didLikePet()
    func cacheImage(from url: String)
}

final class HomeViewModel {

    weak var delegate: HomeViewModelDelegate?
    weak var tabBarDelegate: MainTabBarViewModelForChildDelegate?
    private let networkManager: NetworkManager
    private let flow = PetSelectionFlow()
    private var noPetsAvailable = false
    private let maxAttempt = 10

    var currentPetIsAvaliable: Bool {
        return flow.currentPet != nil
    }

    var currentPetPhotoURLs: [String] {
        return flow.currentPet?.card.photoURLs ?? []
    }

    var currentPetName: String {
        return flow.currentPet?.card.name ?? ""
    }

    var currentPetStatus: String {
        return currentPetAge + " • " + currentPetSize + " • " + currentPetDistance
    }

    private var currentPetAge: String {
        return flow.currentPet?.card.age ?? ""
    }

    private var currentPetSize: String {
        return flow.currentPet?.card.size ?? ""
    }

    private var currentPetDistance: String {
        // Currently using placeholder value because the web server is not available yet. Once the backend is up Pet.card should provide distance.
        return "0.7 Miles"
    }

    var currentPetTags: [PetTagType: String] {
        return flow.currentPet?.card.petTags ?? [:]
    }

    private var currentQueuedPetsIDs: [String] {
        return flow.currentQueuedPetIDs
    }

    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }

    // MARK: - Loading Pet

    func loadFirstBatch() {
        networkManager.getRandomPet(withCurrentList: []) { [weak self] result in
            switch result {
            case .success(let nextPet):
                self?.flow.addToQueue(pet: nextPet)
                if let petsFirstImageURL = nextPet.card.photoURLs[ip_safely: 0] {
                    self?.delegate?.cacheImage(from: petsFirstImageURL)
                }
                self?.delegate?.didLikePet()
                guard let self = self else { return }
                self.noPetsAvailable = false
                self.addPetsToQueue(numberOfPets: self.maxAttempt)
            case .failure(let error):
                print(error.localizedDescription)
                self?.noPetsAvailable = true
            }
        }
    }

    private func addPetsToQueue(numberOfPets: Int) {
        guard flow.needsRefill && !noPetsAvailable else { return }
        networkManager.getRandomPet(withCurrentList: currentQueuedPetsIDs) { [weak self] result in
            switch result {
            case .success(let nextPet):
                self?.flow.addToQueue(pet: nextPet)
                if let petsFirstImageURL = nextPet.card.photoURLs[ip_safely: 0] {
                    self?.delegate?.cacheImage(from: petsFirstImageURL)
                }
                if numberOfPets > 1 {
                    self?.addPetsToQueue(numberOfPets: numberOfPets - 1)
                }
            case .failure(let error):
                print(error.localizedDescription)
                self?.noPetsAvailable = true
            }
        }
    }

    private func showEmptyState() {

    }

    // MARK: - Button Actions

    func likeButtonTapped() {
        guard let petID = flow.currentPet?.id else { return }
        networkManager.like(petId: petID) { result in
            if case .failure(let error) = result {
                print(error.localizedDescription)
            }
        }
        tabBarDelegate?.likedCountDidIncrease()
        flow.nextPet()
        addPetsToQueue(numberOfPets: 1)
        delegate?.didLikePet()
    }

    func dislikeButtonTapped() {
        guard let petID = flow.currentPet?.id else { return }
        networkManager.dislike(petId: petID) { result in
            if case .failure(let error) = result {
                print(error.localizedDescription)
            }
        }
        flow.nextPet()
        addPetsToQueue(numberOfPets: 1)
        delegate?.didLikePet()
    }
}
