//
//  LocalHomeDataRepository.swift
//  Fetch
//
//  Created by yi.hao on 4/1/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import Foundation
import UIKit

final class MockNetworkManager: NetworkManager {

    let mockPets: [Pet]
    var mockQueryData: [Pet]
    var likedPets: [Pet] = []

    init(fileName: String) {
        mockPets = Pets.load(fileName: fileName)
        mockQueryData = mockPets
    }

    func getPet(withCurrentList: [String], completion: ( (Result<Pet, NetworkError>) -> Void)) {
        if mockQueryData.isEmpty {
            completion(Result.failure(NetworkError.noPetsAvailable))
        } else {
            completion(Result.success(mockQueryData.removeFirst()))
        }
    }

    func like(petId: String, completion: ((Result<Void, NetworkError>) -> Void)?) {
        guard let pet = mockPets.first(where: {$0.id == petId}) else {
            completion?(Result.failure(.invalidPetID))
            return
        }
        completion?(Result.success(()))
        likedPets.append(pet)
    }

    func dislike(petId: String, completion: ((Result<Void, NetworkError>) -> Void)?) {
    }

    func getLikedCount(completion: ((Result<Int, NetworkError>) -> Void)) {
        completion(Result.success(likedPets.count))
    }
}
