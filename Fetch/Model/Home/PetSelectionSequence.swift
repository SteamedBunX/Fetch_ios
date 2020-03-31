//
//  PetSelectionSequence.swift
//  Fetch
//
//  Created by yi.hao on 3/31/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import Foundation

final class PetSelectionSequences {

    private let minPetInQueue = 10
    private let maxPetInQueue = 20

    private var pets = Queue<Pet>()
    private(set) var currentPet: Pet?

    // MARK: - Displayables

    var hasPetInQueue: Bool {
        return !pets.isEmpty
    }

    var needRefill: Bool {
        return pets.count < minPetInQueue
    }

    // MARK: - Fetching Information

    func addToQueue(pet: Pet) {
        if currentPet == nil {
            currentPet = pet
        } else {
            pets.enqueue(pet)
        }
    }

    func nextPet() {
        currentPet = pets.dequeue()
    }
}
