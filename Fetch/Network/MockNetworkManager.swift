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
    var userToken: String = ""

    init(fileName: String = "pets") {
        mockPets = Pets.load(fileName: fileName)
        mockQueryData = mockPets
    }

    func loadUserTokenFromCache() {
    }

    func login(authenticationInfo: AuthInput, completion: @escaping (Result<Void, NetworkError>) -> Void) {
        completion(.success(()))
    }

    func getUserOnboardingStatus(completion: @escaping (Result<Bool, NetworkError>) -> Void) {
        completion(.success(false))
    }

    func onboard(withResult sequenceResult: [OnboardingSection], completion: ((Result<Void, NetworkError>) -> Void)?) {
        completion?(.success(()))
    }

    func getRandomPet(withCurrentList: [String], completion: ( (Result<Pet, NetworkError>) -> Void)) {
        if mockQueryData.isEmpty {
            completion(.failure(NetworkError.noPetsAvailable))
        } else {
            completion(.success(mockQueryData.removeFirst()))
        }
    }

    func like(petId: String, completion: ((Result<Void, NetworkError>) -> Void)?) {
        guard let pet = mockPets.first(where: {$0.id == petId}) else {
            completion?(.failure(.invalidPetID))
            return
        }
        completion?(.success(()))
        likedPets.append(pet)
    }

    func dislike(petId: String, completion: ((Result<Void, NetworkError>) -> Void)?) {
        completion?(.success(()))
    }

    func getLikedCount(completion: ((Result<Int, NetworkError>) -> Void)) {
        completion(.success(likedPets.count))
    }

    func sendUserPreferences(_ sequence: OnboardingSequence, completion: ((Result<Void, NetworkError>) -> Void)?) {
        completion?(.success(()))
    }

    func getLikedPets(completion: @escaping (Result<[Pet], NetworkError>) -> Void) {
        After(2.0) { [likedPets] in
            completion(.success(likedPets))
        }
    }
}
