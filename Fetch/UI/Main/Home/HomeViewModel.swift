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

    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }

    // MARK: - Loading Pet

    func loadFirstBatch() {
        noPetsAvailable = false
        while flow.needsRefill, !noPetsAvailable {
            addPetToQueue()
        }
    }

    private func addPetToQueue() {
        guard flow.needsRefill else { return }
        networkManager.getPet(withCurrentList: [], for: "") { [weak self] result in
            switch result {
            case .success(let nextPet):
                self?.flow.addToQueue(pet: nextPet)
                if let petsFirstImageURL = nextPet.card.photoURLs[ip_safely: 0] {
                    self?.delegate?.cacheImage(from: petsFirstImageURL)
                }
            case .failure(let error):
                switch error {
                case .noPetsAvailable:
                    self?.showEmptyState()
                case .unknownError(let unknownError):
                    print(unknownError.localizedDescription)
                }
                self?.noPetsAvailable = true
            }
        }
    }

    private func showEmptyState() {

    }

    // MARK: - Button Actions

    func likeButtonTapped() {
        networkManager.like(for: "", petId: flow.currentPet?.id ?? "") { _ in}
        addPetToQueue()
        flow.nextPet()
        delegate?.didLikePet()
        tabBarViewModel?.likedCountDidIncrease()
    }

    func dislikeButtonTapped() {
        networkManager.dislike(for: "", petId: flow.currentPet?.id ?? "") { _ in}
        addPetToQueue()
        flow.nextPet()
        delegate?.didLikePet()
    }
}
