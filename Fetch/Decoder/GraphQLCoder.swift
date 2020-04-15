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

    static func getUserPreferences(fromSequenceResult sequence: [OnboardingSection]) -> UserUpdateInput {
        var result = UserUpdateInput()
        sequence.forEach { section in
            section.questions.forEach { question in
                switch question.reference {
                case .type:
                    var petTypePreference = [`Type`]()
                    question.selectedIndexes.forEach { choice in
                        switch choice {
                        case 0:
                            petTypePreference.append(.dog)
                        case 1:
                            petTypePreference.append(.cat)
                        default:
                            break
                        }
                    }
                    result.petTypePreference = petTypePreference
                case .zipCode:
                    result.zipcode = question.inputText
                case .experienceLevel:
                    question.selectedIndexes.forEach { choice in
                        switch choice {
                        case 0:
                            result.petExperienceLevel = .anExpert
                        case 1:
                            result.petExperienceLevel = .experienced
                        case 2:
                            result.petExperienceLevel = .aNovice
                        default:
                            break
                        }
                    }
                case .size:
                    var petSizePreference = [Size]()
                    question.selectedIndexes.forEach { choice in
                        switch choice {
                        case 0:
                            petSizePreference.append(.small)
                        case 1:
                            petSizePreference.append(.medium)
                        case 2:
                            petSizePreference.append(.large)
                        default:
                            break
                        }
                    }
                    result.petSizePreference = petSizePreference
                case .sex:
                    var petSexPreference = [Sex]()
                    question.selectedIndexes.forEach { choice in
                        switch choice {
                        case 0:
                            petSexPreference.append(.male)
                        case 1:
                            petSexPreference.append(.female)
                        default:
                            break
                        }
                    }
                    result.petSexPreference = petSexPreference
                case .affinity:
                    result.petGoodWithDogsPreference = false
                    result.petGoodWithCatsPreference = false
                    result.petGoodWithChildrenPreference = false
                    question.selectedIndexes.forEach { choice in
                        switch choice {
                        case 0:
                            result.petGoodWithDogsPreference = true
                        case 1:
                            result.petGoodWithCatsPreference = true
                        case 2:
                            result.petGoodWithChildrenPreference = true
                        default:
                            break
                        }
                    }
                case .activityValue:
                    var petActivityPreference = [Activity]()
                    question.selectedIndexes.forEach { choice in
                        switch choice {
                        case 0:
                            petActivityPreference.append(.aCouchPotato)
                        case 1:
                            petActivityPreference.append(.active)
                        case 2:
                            petActivityPreference.append(.anAthlete)
                        default:
                            break
                        }
                    }
                    result.petActivityPreference = petActivityPreference
                case .socialValue:
                    var petSocialPreference = [Social]()
                    question.selectedIndexes.forEach { choice in
                        switch choice {
                        case 0:
                            petSocialPreference.append(.aWallFlower)
                        case 1:
                            petSocialPreference.append(.social)
                        case 2:
                            petSocialPreference.append(.lifeOfTheParty)
                        default:
                            break
                        }
                    }
                    result.petSocialPreference = petSocialPreference
                case .trainabilityValue:
                    var petTrainabilityPreference = [Trainability]()
                    question.selectedIndexes.forEach { choice in
                        switch choice {
                        case 0:
                            petTrainabilityPreference.append(.classClown)
                        case 1:
                            petTrainabilityPreference.append(.attentiveStudent)
                        case 2:
                            petTrainabilityPreference.append(.teachersPet)
                        default:
                            break
                        }
                    }
                    result.petTrainabilityPreference = petTrainabilityPreference
                case .dependencyLevel:
                    var petDependencyPreference = [Dependency]()
                    question.selectedIndexes.forEach { choice in
                        switch choice {
                        case 0:
                            petDependencyPreference.append(.independent)
                        case 1:
                            petDependencyPreference.append(.somewhatDependent)
                        case 2:
                            petDependencyPreference.append(.dependent)
                        default:
                            break
                        }
                    }
                    result.petDependencyPreference = petDependencyPreference
                }
            }
        }
        return result
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
