//
//  LikedPet.swift
//  Fetch
//
//  Created by Alvin Andino on 4/15/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import Foundation

protocol LikedPet {
    var id: String { get }
    var photoURLs: [String] { get }
    var petName: String { get }
    var petAge: String { get }
    var petSize: String { get }
    var distance: Double { get }
}

extension GetAllLikedPetsQuery.Data.LikedPet.Pet: LikedPet {
    var photoURLs: [String] {
        return photos?.compactMap { $0 } ?? []
    }

    var petName: String {
        return name ?? ""
    }

    var petAge: String {
        return age.rawValue.capitalized
    }

    var petSize: String {
        return size.rawValue.capitalized
    }

    var distance: Double {
        return distanceToUser ?? 0.0
    }
}

extension Pet: LikedPet {
    var photoURLs: [String] {
        return card.photoURLs
    }

    var petName: String {
        return card.name
    }

    var petAge: String {
        return card.age
    }

    var petSize: String {
        return card.size
    }

    var distance: Double {
        return card.distance
    }
}
