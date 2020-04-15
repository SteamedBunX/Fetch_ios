//
//  Pets.swift
//  Fetch
//
//  Created by yi.hao on 4/1/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import Foundation

enum Pets {

    static func load(fileName: String) -> [Pet] {
        var pets = [Pet]()
        var resultBundles: [PetBundle]?
        guard let path = Bundle.main.path(forResource: fileName, ofType: "json")
            else { return [] }
        do {
            let fileUrl = URL(fileURLWithPath: path)
            // Getting data from JSON file using the file URL
            let data = try Data(contentsOf: fileUrl, options: .mappedIfSafe)
            resultBundles = try? JSONDecoder().decode([PetBundle].self, from: data)
        } catch {
            return []
        }
        resultBundles?.forEach { bundle in
            var photoURLs = [String]()
            bundle.photos?.forEach { photoURL in
                photoURLs.append(photoURL?.medium ?? "")
            }

            let profileCard = PetProfileInfo(photoURLs: photoURLs,
                                             name: bundle.name ?? "",
                                             age: bundle.age ?? "",
                                             size: bundle.size ?? "",
                                             petTags: bundle.petTags,
                                             distance: 7.0)
            pets.append(Pet(id: bundle.id ?? "", card: profileCard))
        }
        return pets
    }
}
