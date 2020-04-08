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
    case unknownError(Error)
}

protocol NetworkManager: AnyObject {

    func getPet(withCurrentList: [String], for userID: String, completion: @escaping(Result<Pet, NetworkError>) -> Void)
    func getLikedCount(forUser: String, completion: @escaping(Result<Int, NetworkError>) -> Void)
    func like(for userID: String, petId: String, completion: @escaping(Result<Bool, NetworkError>) -> Void)
    func dislike(for userID: String, petId: String, completion: @escaping(Result<Bool, NetworkError>) -> Void)
}
