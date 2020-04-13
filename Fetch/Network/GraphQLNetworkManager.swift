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
    private(set) lazy var apollo = ApolloClient(url: URL(string: endPoint)!)
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

    func getRandomPet(withCurrentList: [String], completion: ((Result<Pet, NetworkError>) -> Void)) {

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
