//
//  LocalHomeDataRepository.swift
//  Fetch
//
//  Created by yi.hao on 4/1/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import Foundation
import UIKit

enum NetWorkError: Error {
    case noMorePetAvailable
    case unknowError(Error)
}

final class MockNetworkManager: NetworkManager {

    var mockPets: [Pet]

    init(fileName: String) {
        mockPets = Pets.load(fileName: fileName)
    }

    func getPet(withCurrentList: [String], forUser: String, completion: @escaping (Result<Pet, NetWorkError>) -> Void) {
        if mockPets.isEmpty {
            completion(Result.failure(NetWorkError.noMorePetAvailable))
        }
        completion(Result.success(mockPets.removeFirst()))
    }
}
