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
    case unknownError(Error)
}

protocol NetworkManager: AnyObject {

    func getPet(withCurrentList: [String], completion: @escaping(Result<Pet, NetworkError>) -> Void)
    func getLikedCount(completion: @escaping(Result<Int, NetworkError>) -> Void)
    func like(petId: String, completion: @escaping(Result<Void, NetworkError>) -> Void)
    func dislike(petId: String, completion: @escaping(Result<Void, NetworkError>) -> Void)
}
