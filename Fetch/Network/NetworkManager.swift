//
//  HomeDataRepository.swift
//  Fetch
//
//  Created by yi.hao on 4/1/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import Foundation
import UIKit

enum NetworkError: Error {
    case noPetsAvailable
    case invalidPetID
    case failToAuthenticate
    case unknownError(Error)
}

protocol NetworkManager: AnyObject {

    var userToken: String { get set }
    func login(authenticationInfo: AuthInput, completion: @escaping (Result<String, NetworkError>) -> Void)
    func checkUserOnboardingStatus(completion: @escaping (Result<Bool, NetworkError>) -> Void)
    func getRandomPet(withCurrentList: [String], completion: @escaping ((Result<Pet, NetworkError>) -> Void))
    func getLikedCount(completion: @escaping ((Result<Int, NetworkError>) -> Void))
    func like(petId: String, completion: ((Result<Void, NetworkError>) -> Void)?)
    func dislike(petId: String, completion: ((Result<Void, NetworkError>) -> Void)?)
    func getLikedPets(completion: @escaping (Result<[Pet], NetworkError>) -> Void)
}
