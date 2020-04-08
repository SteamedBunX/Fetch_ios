//
//  HomeDataRepository.swift
//  Fetch
//
//  Created by yi.hao on 4/1/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import Foundation
import UIKit

protocol NetworkManager: AnyObject {

    func getPet(withCurrentList: [String], forUser: String, completion: @escaping(Result<Pet, NetworkError>) -> Void)
}
