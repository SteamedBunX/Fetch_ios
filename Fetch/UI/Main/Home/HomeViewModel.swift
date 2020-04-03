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
    private let flow = PetSelectionSequences()
    private(set) var imagePlaceHolder = UIImage(named: "main_noPictureIcon") ?? UIImage()

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
        if let nextPet = networkManager.getPet(withCurrentList: [], forUser: "") {
            flow.addToQueue(pet: nextPet)
            if let petsFirstImageURL = nextPet.card.photoURLs[ip_safely: 0] {
                delegate?.cacheImage(from: petsFirstImageURL)
            }
        }
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
