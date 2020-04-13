//
//  LocalHomeDataRepository.swift
//  Fetch
//
//  Created by yi.hao on 4/1/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import Intrepid

final class MockNetworkManager: NetworkManager {

    let mockPets: [Pet]
    var mockQueryData: [Pet]
    var likedPets: [Pet] = []

    init(fileName: String = "pets") {
        mockPets = Pets.load(fileName: fileName)
        mockQueryData = mockPets
    }

    func loadUserTokenFromCache() {
    }

    func login(authenticationInfo: AuthInput, completion: @escaping (String) -> Void) {
        completion("")
    }

    func checkUserOnboardingStatus(completion: @escaping (Bool) -> Void) {
        completion(false)
    }

    func getPet(withCurrentList: [String], completion: ( (Result<Pet, NetworkError>) -> Void)) {

    func getRandomPet(withCurrentList: [String], completion: ( (Result<Pet, NetworkError>) -> Void)) {
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

    func getLikedPets(completion: @escaping (Result<[Pet], NetworkError>) -> Void) {
        After(2.0) { [likedPets] in
            completion(.success(likedPets))
        }
    }
}
