//
//  GraphQLCoder.swift
//  Fetch
//
//  Created by yi.hao on 4/13/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import Foundation

enum GraphQLCoder {

    static func getPet(from randomPet: GetRandomPetQuery.Data.RandomPet) -> Pet {
        let card = PetProfileInfo(photoURLs: randomPet.photos?.compactMap {$0} ?? [],
                                  name: randomPet.name ?? "",
                                  age: getPetAgeString(fromRandomPet: randomPet),
                                  size: getPetSizeString(fromRandomPet: randomPet),
                                  petTags: getPetTags(fromRandomPet: randomPet))
        return Pet(id: randomPet.id, card: card)
    }

    private static func getUserPreferences(fromOnboardingSequence sequence: OnboardingSequence) {
        
    }

    private static func getPetAgeString(fromRandomPet randomPet: GetRandomPetQuery.Data.RandomPet) -> String {
        switch randomPet.age {
        case .adult:
            return "Adult"
        case .senior:
            return "Senior"
        case .young:
            return "Young"
        case .__unknown(_):
            return ""
        }
    }

    private static func getPetSizeString(fromRandomPet randomPet: GetRandomPetQuery.Data.RandomPet) -> String {
        switch randomPet.size {
        case .large:
            return "Large"
        case .medium:
            return "Medium"
        case .small:
            return "Small"
        case .__unknown(_):
            return ""
        }
    }

    private static func getPetTags(fromRandomPet randomPet: GetRandomPetQuery.Data.RandomPet) -> [PetTagType: String] {
        var result = [PetTagType: String]()
        switch randomPet.petDependencyValue {
        case .independent:
            result[PetTagType.dependencyValue] = "Independent"
        case .somewhatDependent:
            result[PetTagType.dependencyValue] = "Semi-dependent"
        case .dependent:
            result[PetTagType.dependencyValue] = "Dependent"
        default:
            break
        }
        switch randomPet.petActivityValue {
        case .aCouchPotato:
            result[PetTagType.activityValue] = "Couch Potato"
        case .active:
            result[PetTagType.activityValue] = "Active"
        case .anAthlete:
            result[PetTagType.activityValue] = "An Athlete"
        default:
            break
        }
        switch randomPet.petSocialValue {
        case .aWallFlower:
            result[PetTagType.socialValue] = "A Wallflower"
        case .social:
            result[PetTagType.socialValue] = "Social"
        case .lifeOfTheParty:
            result[PetTagType.socialValue] = "Life of the Party"
        default:
            break
        }
        switch randomPet.petTrainabilityValue {
        case .classClown:
            result[PetTagType.trainabilityValue] = "Class Clown"
        case .attentiveStudent:
            result[PetTagType.trainabilityValue] = "Attentive"
        case .teachersPet:
            result[PetTagType.trainabilityValue] = "Teacher's Pet"
        default:
            break
        }
        return result
    }
}
