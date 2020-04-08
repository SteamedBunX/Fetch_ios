//
//  LocalHomeDataRepository.swift
//  Fetch
//
//  Created by yi.hao on 4/1/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import Foundation
import UIKit

enum NetworkError: Error {
    case noPetsAvailable
    case unknownError(Error)
}

final class MockNetworkManager: NetworkManager {

    var currentPet: Pet
    var mockPets: [Pet]
    var likedPets: [Pet] = []

    init(fileName: String) {
        mockPets = Pets.load(fileName: fileName)
        currentPet = mockPets[0]
    }

    func getPet(withCurrentList: [String], for user: String, completion: @escaping (Result<Pet, NetworkError>) -> Void) {
        if mockPets.isEmpty {
            completion(Result.failure(NetworkError.noPetsAvailable))
        } else {
            completion(Result.success(mockPets.removeFirst()))
        }
<<<<<<< HEAD
=======
        currentPet = mockPets.removeFirst()
        completion(Result.success(currentPet))
>>>>>>> 0fb008d... [FETCH-204] Renamed All Unlike to Dislike.
    }

    func like(for userID: String, petId: String, completion: @escaping(Result<Bool, NetworkError>) -> Void) {
        likedPets.append(currentPet)
    }

    func dislike(for userID: String, petId: String, completion: @escaping(Result<Bool, NetworkError>) -> Void) {
    }

    func getLikedCount(forUser: String, completion: @escaping(Result<Int, NetworkError>) -> Void) {
        completion(Result.success(likedPets.count))
    }
}
