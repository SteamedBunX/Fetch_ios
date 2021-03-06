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

    var currentPet: Pet? {
        return flow.currentPet
    }

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
        return currentPetAge + " • " + currentPetSize + " • " + currentPetDistanceText
    }

    private var currentPetAge: String {
        return flow.currentPet?.card.age ?? ""
    }

    private var currentPetSize: String {
        return flow.currentPet?.card.size ?? ""
    }

    private var currentPetDistanceText: String {
        return "\(flow.currentPet?.card.distance ?? 0.0) Miles"
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
        guard let pet = currentPet else { return }
        networkManager.like(petId: pet.id) { result in
            if case .failure(let error) = result {
                print(error.localizedDescription)
            }
        }
        tabBarDelegate?.didLike(pet: pet)
        flow.nextPet()
        addPetsToQueue(numberOfPets: 1)
        delegate?.didLikePet()
    }

    func dislikeButtonTapped() {
        guard let pet = currentPet else { return }
        networkManager.dislike(petId: pet.id) { result in
            if case .failure(let error) = result {
                print(error.localizedDescription)
            }
        }
        tabBarDelegate?.didDislike(pet: pet)
        flow.nextPet()
        addPetsToQueue(numberOfPets: 1)
        delegate?.didLikePet()
    }
}
