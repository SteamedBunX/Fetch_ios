//
//  PetDecodable.swift
//  Fetch
//
//  Created by yi.hao on 4/1/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import Foundation

final class PetBundle: Decodable {

    let id: String?
    let name: String?
    let age: String?
    let size: String?
    let photos: [ImageURLBundle?]?
    let petTags: [PetTagType: String]
    //      "pet_dependency_value": "constantly",
    //      "pet_activity_value": "a couch potato",
    //      "pet_social_value": "social",
    //      "pet_trainability_value": "teachers pet",

    // referance
    //    {
    //      "id": "91e2ff22-3771-4335-9f17-1c748d1d445c",
    //      "name": "Frankie",
    //      "age": "Baby",
    //      "status": "adoptable",
    //      "description": "This puppy is still available unless marked pending.\n\nThese puppies were born to one of the most beautiful gentlest American...",
    //      "photos": [
    //        {
    //          "small": "https://dl5zpyw5k3jeb.cloudfront.net/photos/pets/47707735/1/?bust=1585285568&width=100",
    //          "medium": "https://dl5zpyw5k3jeb.cloudfront.net/photos/pets/47707735/1/?bust=1585285568&width=300",
    //          "large": "https://dl5zpyw5k3jeb.cloudfront.net/photos/pets/47707735/1/?bust=1585285568&width=600",
    //          "full": "https://dl5zpyw5k3jeb.cloudfront.net/photos/pets/47707735/1/?bust=1585285568"
    //        },
    //        {
    //          "small": "https://dl5zpyw5k3jeb.cloudfront.net/photos/pets/47707735/2/?bust=1585285574&width=100",
    //          "medium": "https://dl5zpyw5k3jeb.cloudfront.net/photos/pets/47707735/2/?bust=1585285574&width=300",
    //          "large": "https://dl5zpyw5k3jeb.cloudfront.net/photos/pets/47707735/2/?bust=1585285574&width=600",
    //          "full": "https://dl5zpyw5k3jeb.cloudfront.net/photos/pets/47707735/2/?bust=1585285574"
    //        },
    //        {
    //          "small": "https://dl5zpyw5k3jeb.cloudfront.net/photos/pets/47707735/3/?bust=1585285577&width=100",
    //          "medium": "https://dl5zpyw5k3jeb.cloudfront.net/photos/pets/47707735/3/?bust=1585285577&width=300",
    //          "large": "https://dl5zpyw5k3jeb.cloudfront.net/photos/pets/47707735/3/?bust=1585285577&width=600",
    //          "full": "https://dl5zpyw5k3jeb.cloudfront.net/photos/pets/47707735/3/?bust=1585285577"
    //        },
    //        {
    //          "small": "https://dl5zpyw5k3jeb.cloudfront.net/photos/pets/47707735/4/?bust=1585285585&width=100",
    //          "medium": "https://dl5zpyw5k3jeb.cloudfront.net/photos/pets/47707735/4/?bust=1585285585&width=300",
    //          "large": "https://dl5zpyw5k3jeb.cloudfront.net/photos/pets/47707735/4/?bust=1585285585&width=600",
    //          "full": "https://dl5zpyw5k3jeb.cloudfront.net/photos/pets/47707735/4/?bust=1585285585"
    //        },
    //        {
    //          "small": "https://dl5zpyw5k3jeb.cloudfront.net/photos/pets/47707735/5/?bust=1585285644&width=100",
    //          "medium": "https://dl5zpyw5k3jeb.cloudfront.net/photos/pets/47707735/5/?bust=1585285644&width=300",
    //          "large": "https://dl5zpyw5k3jeb.cloudfront.net/photos/pets/47707735/5/?bust=1585285644&width=600",
    //          "full": "https://dl5zpyw5k3jeb.cloudfront.net/photos/pets/47707735/5/?bust=1585285644"
    //        }
    //      ],
    //      "shelter": {
    //        "name": "No Greater Love",
    //        "email": "adoptngl@gmail.com",
    //        "phone": "NA",
    //        "zipcode": "35446",
    //        "hours": {
    //          "monday": null,
    //          "tuesday": null,
    //          "wednesday": null,
    //          "thursday": null,
    //          "friday": null,
    //          "saturday": null,
    //          "sunday": null
    //        }
    //      },
    //      "size": "Large",
    //      "primary_breed": "American Staffordshire Terrier",
    //      "secondary_breed": "Pit Bull Terrier",
    //      "is_mixed_breed": true,
    //      "is_unknown_breed": false,
    //      "species_name": "Dog",
    //      "coat": "Short",
    //      "primary_color": null,
    //      "secondary_color": null,
    //      "tertiary_color": null,
    //      "spayed_or_neutered": false,
    //      "house_trained": false,
    //      "declawed": null,
    //      "special_needs": false,
    //      "shots_are_current": true,
    //      "good_with_children": true,
    //      "good_with_dogs": true,
    //      "good_with_cats": false,
    //      "pet_dependency_value": "constantly",
    //      "pet_activity_value": "a couch potato",
    //      "pet_social_value": "social",
    //      "pet_trainability_value": "teachers pet",
    //      "recommended_experience_level": "an expert"
    //    }

    private enum CodingKeys: String, CodingKey {
        case id, name, age, size, photos
        case dependencyValue = "pet_dependency_value"
        case activityValue = "pet_activity_value"
        case socialValue = "pet_social_value"
        case trainabilityValue = "pet_trainability_value"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try? container.decode(String.self, forKey: .id)
        name = try? container.decode(String.self, forKey: .name)
        age = try? container.decode(String.self, forKey: .age)
        size = try? container.decode(String.self, forKey: .size)
        photos = try? container.decode([ImageURLBundle].self, forKey: .photos)
        var petTags =  [PetTagType: String]()
        if let dependencyValue = try? container.decode(String.self, forKey: .dependencyValue) {
            petTags[.dependencyValue] = dependencyValue
        }
        if let activityValue = try? container.decode(String.self, forKey: .activityValue) {
            petTags[.activityValue] = activityValue
        }
        if let socialValue = try? container.decode(String.self, forKey: .socialValue) {
            petTags[.socialValue] = socialValue
        }
        if let trainabilityValue = try? container.decode(String.self, forKey: .trainabilityValue) {
            petTags[.trainabilityValue] = trainabilityValue
        }
        self.petTags = petTags
    }
}
