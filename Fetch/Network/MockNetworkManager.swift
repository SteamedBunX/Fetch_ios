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

    var mockPets = Pets.load()

    var hasMoreAvaliable: Bool {
        return !mockPets.isEmpty
    }

    func getPet(withCurrentList: [String], forUser: String) -> Pet? {
        if mockPets.isEmpty {
            return nil
        }
        return mockPets.removeFirst()
    }
}
