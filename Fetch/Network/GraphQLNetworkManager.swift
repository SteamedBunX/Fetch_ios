//
//  GraphQLNetworkManager.swift
//  Fetch
//
//  Created by yi.hao on 4/9/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import Foundation
import Apollo

final class GraphQLNetworkManager: NetworkManager {

    static let shared = GraphQLNetworkManager()
    private let endPoint = "https://fetch-server-staging.herokuapp.com/"
    private lazy var networkTransport: HTTPNetworkTransport = {
      let transport = HTTPNetworkTransport(url: URL(string: endPoint)!)
      transport.delegate = self
      return transport
    }()
    private(set) lazy var apollo = ApolloClient(networkTransport: self.networkTransport)
    private let userDefaults = UserDefaults.standard
    private var userToken: String {
        return userDefaults.string(forKey: UserDefaultsKeys.userToken) ?? ""
    }

    private init() {}

    func login(authenticationInfo: AuthInput, completion: @escaping (Result<Void, NetworkError>) -> Void) {
        apollo.perform(mutation: LoginMutation(auth: authenticationInfo)) {[weak self] result in
            switch result {
            case .success(let resultData):
                guard let resultToken = resultData.data?.createUser?.token else {
                    completion(.failure(.failToAuthenticate))
                    return
                }
                self?.storeUserToken(userToken: resultToken)
                completion(.success(()))
            case .failure(let error):
                completion(.failure(.unknownError(error)))
            }
        }
    }

    func checkUserOnboardingStatus(completion: @escaping (Result<Bool, NetworkError>) -> Void) {
        apollo.fetch(query: IsUserOnboardedQuery()) { result in
            switch result {
            case .success(let resultData):
                completion(.success(resultData.data?.currentUser.petSizePreference != nil))
            case .failure(let error):
                completion(.failure(.unknownError(error)))
            }
        }
    }

    func getRandomPet(withCurrentList: [String], completion: @escaping ((Result<Pet, NetworkError>) -> Void)) {
        let queuedPets = withCurrentList.map { (id) -> GraphQLID in
            GraphQLID(id)
        }
        apollo.fetch(query: GetRandomPetQuery(queuedPets: queuedPets)) { [weak self] result in
            switch result {
            case .success(let data):
                guard let petDecodable = data.data?.randomPet else { print("failed to decode pet")
                    return
                }
                let card = PetProfileInfo(photoURLs: petDecodable.photos?.compactMap {$0} ?? [],
                                          name: petDecodable.name ?? "",
                                          age: self?.getPetAgeString(from: petDecodable) ?? "",
                                          size: self?.getPetSizeString(from: petDecodable) ?? "",
                                          petTags: self?.getPetTags(from: petDecodable) ?? [:])
                let resultPet = Pet(id: petDecodable.id, card: card)
                print("Fetch New Pet: \(card.name)")
                completion(.success(resultPet))
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    private func getPetAgeString(from petDecodable: GetRandomPetQuery.Data.RandomPet) -> String {
        switch petDecodable.age {
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

    private func getPetSizeString(from petDecodable: GetRandomPetQuery.Data.RandomPet) -> String {
        switch petDecodable.size {
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

    private func getPetTags(from petDecodable: GetRandomPetQuery.Data.RandomPet) -> [PetTagType: String] {
        var result = [PetTagType: String]()
        switch petDecodable.petDependencyValue {
        case .independent:
            result[PetTagType.dependencyValue] = "Independent"
        case .somewhatDependent:
            result[PetTagType.dependencyValue] = "Semi-dependent"
        case .dependent:
            result[PetTagType.dependencyValue] = "Dependent"
        default:
            break
        }
        switch petDecodable.petActivityValue {
        case .aCouchPotato:
            result[PetTagType.activityValue] = "Couch Potato"
        case .active:
            result[PetTagType.activityValue] = "Active"
        case .anAthlete:
            result[PetTagType.activityValue] = "An Athlete"
        default:
            break
        }
        switch petDecodable.petSocialValue {
        case .aWallFlower:
            result[PetTagType.socialValue] = "A WallFlower"
        case .social:
            result[PetTagType.socialValue] = "Social"
        case .lifeOfTheParty:
            result[PetTagType.socialValue] = "Life of the Party"
        default:
            break
        }
        switch petDecodable.petTrainabilityValue {
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

    func getLikedCount(completion: ((Result<Int, NetworkError>) -> Void)) {

    }

    func like(petId: String, completion: ((Result<Void, NetworkError>) -> Void)?) {

    }

    func dislike(petId: String, completion: ((Result<Void, NetworkError>) -> Void)?) {

    }

    private func storeUserToken(userToken: String) {
        userDefaults.setValue(userToken, forKey: UserDefaultsKeys.userToken)
    }
}

extension GraphQLNetworkManager: HTTPNetworkTransportPreflightDelegate {
    func networkTransport(_ networkTransport: HTTPNetworkTransport, shouldSend request: URLRequest) -> Bool {
        return true
    }

    func networkTransport(_ networkTransport: HTTPNetworkTransport,
                          willSend request: inout URLRequest) {

      // Get the existing headers, or create new ones if they're nil
      var headers = request.allHTTPHeaderFields ?? [String: String]()

      // Add any new headers you need
      headers["Authorization"] = userTokan

      // Re-assign the updated headers to the request.
      request.allHTTPHeaderFields = headers
    }
}
