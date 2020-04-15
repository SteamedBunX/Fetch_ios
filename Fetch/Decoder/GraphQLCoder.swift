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

    private static func getPetType(fromQuestion question: OnboardingQuestion) -> [`Type`] {
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
        return petTypePreference
    }

    private static func getPetExperienceLevel(fromQuestion question: OnboardingQuestion) -> Experience {
        var result = Experience.aNovice
        question.selectedIndexes.forEach { choice in
            switch choice {
            case 0:
                result = .anExpert
            case 1:
                result = .experienced
            case 2:
                result = .aNovice
            default:
                break
            }
        }
        return result
    }

    private static func getPetSizePreference(fromQuestion question: OnboardingQuestion) -> [Size] {
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
        return petSizePreference
    }

    private static func getPetSexPreference(fromQuestion question: OnboardingQuestion) -> [Sex] {
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
        return petSexPreference
    }

    private static func getPetActivityPreference(fromQuestion question: OnboardingQuestion) -> [Activity] {
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
        return petActivityPreference
    }

    private static func getPetSocialPreference(fromQuestion question: OnboardingQuestion) -> [Social] {
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
        return petSocialPreference
    }

    private static func getPetTrainabilityPreference(fromQuestion question: OnboardingQuestion) -> [Trainability] {
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
        return petTrainabilityPreference
    }

    private static func getPetDependencyPreference(_ question: OnboardingQuestion) -> [Dependency] {
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
        return petDependencyPreference
    }

    static func getUserPreferences(fromSequenceResult sequence: [OnboardingSection]) -> UserUpdateInput {
        var result = UserUpdateInput()
        sequence.forEach { section in
            section.questions.forEach { question in
                switch question.reference {
                case .type:
                    result.petTypePreference = getPetType(fromQuestion: question)
                case .zipCode:
                    result.zipcode = question.inputText
                case .experienceLevel:
                    result.petExperienceLevel = getPetExperienceLevel(fromQuestion: question)
                case .size:
                    result.petSizePreference = getPetSizePreference(fromQuestion: question)
                case .sex:
                    result.petSexPreference = getPetSexPreference(fromQuestion: question)
                case .affinity:
                    result.petGoodWithDogsPreference = question.selectedIndexes.contains(0)
                    result.petGoodWithCatsPreference = question.selectedIndexes.contains(1)
                    result.petGoodWithChildrenPreference = question.selectedIndexes.contains(2)
                case .activityValue:
                    result.petActivityPreference = getPetActivityPreference(fromQuestion: question)
                case .socialValue:
                    result.petSocialPreference =  getPetSocialPreference(fromQuestion: question)
                case .trainabilityValue:
                    result.petTrainabilityPreference = getPetTrainabilityPreference(fromQuestion: question)
                case .dependencyLevel:
                    result.petDependencyPreference = getPetDependencyPreference(question)
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
