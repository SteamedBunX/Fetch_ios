//
//  Pet.swift
//  Fetch
//
//  Created by yi.hao on 3/31/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import Foundation
import UIKit

struct Pet: Equatable {
    let id: String
    let card: ProfileCard

    static func == (lhs: Pet, rhs: Pet) -> Bool {
        return rhs.id == lhs.id
    }
}
