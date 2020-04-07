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
    func didLikePet(_ liked: Bool)
    func cacheImage(from url: String)
}

final class HomeViewModel {

    weak var delegate: HomeViewModelDelegate?
    private let networkManager: NetworkManager
    private let flow = PetSelectionFlow()

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
        while flow.needRefill {
            addPetToQueue()
        }
    }

    private func addPetToQueue() {
        guard flow.needRefill, networkManager.hasMoreAvaliable else { return }
        networkManager.getPet(withCurrentList: [], forUser: "") { result in
            switch result {
            case .success(let nextPet):
                self.flow.addToQueue(pet: nextPet)
                if let petsFirstImageURL = nextPet.card.photoURLs[ip_safely: 0] {
                    self.delegate?.cacheImage(from: petsFirstImageURL)
                }
            case .failure(let error):
                switch error {
                case .noMorePetAvailable:
                    self.showEmptyState()
                case .unknowError(let unknowError):
                    print(unknowError.localizedDescription)
                }
            }
        }
    }

    private func showEmptyState() {

    }

    // MARK: - Button Actions

    func likeButtonTapped() {
        // TODO: Make network call to like the pet
        addPetToQueue()
        flow.nextPet()
        delegate?.didLikePet(true)
    }

    func unlikeButtonTapped() {
        // TODO: Make network call to like the pet
        addPetToQueue()
        flow.nextPet()
        delegate?.didLikePet(false)
    }
}
