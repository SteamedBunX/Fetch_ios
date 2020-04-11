//
//  LikedPetsCollectionViewCellViewModel.swift
//  Fetch
//
//  Created by Alvin Andino on 4/10/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import UIKit

protocol LikedPetsCollectionViewCellViewModel {
    var imageUrl: String { get }
    var placeHolderImage: UIImage { get }
    var name: String { get }
    var distance: String { get }
    var age: String { get }
    var size: String { get }
}

extension LikedPetsCollectionViewCellViewModel {
    var imageURL: URL? {
        return URL(string: imageUrl)
    }
}

struct MockLikedPetsCollectionViewCellViewModel: LikedPetsCollectionViewCellViewModel {
    let imageUrl: String
    let placeHolderImage: UIImage
    let name: String
    let distance: String
    let age: String
    let size: String
}

struct PlaceHolderLikedPetsCollectionViewCellViewModel: LikedPetsCollectionViewCellViewModel {
    let imageUrl: String = ""
    let placeHolderImage: UIImage = #imageLiteral(resourceName: "main_noPictureIcon")
    let name: String = "Name"
    let distance: String = "Distance Away"
    let age: String = "Age"
    let size: String = "Size"
}
