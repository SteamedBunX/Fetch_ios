//
//  LikedPetsCollectionViewCellViewModel.swift
//  Fetch
//
//  Created by Alvin Andino on 4/10/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import UIKit

struct LikedPetsCollectionViewCellViewModel {
    let imageURLString: String
    let placeHolderImage: UIImage
    let name: String
    let distance: String
    let age: String
    let size: String

    init(
        imageURLString: String = "",
        placeHolderImage: UIImage = #imageLiteral(resourceName: "main_noPictureIcon"),
        name: String = "Name",
        distance: String = "Some Distance Away",
        age: String = "Age",
        size: String = "Size"
    ) {
        self.imageURLString = imageURLString
        self.placeHolderImage = placeHolderImage
        self.name = name
        self.distance = distance
        self.age = age
        self.size = size
    }
}

extension LikedPetsCollectionViewCellViewModel {
    var imageURL: URL? {
        return URL(string: imageURLString)
    }
}
