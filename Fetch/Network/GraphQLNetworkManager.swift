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
        apollo.fetch(query: GetRandomPetQuery(queuedPets: queuedPets)) { result in
            switch result {
            case .success(let data):
                guard let petDecodable = data.data?.randomPet else { print("failed to decode pet")
                    return
                }
                let resultPet = GraphQLCoder.getPet(from: petDecodable)
                completion(.success(resultPet))
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    func getLikedCount(completion: ((Result<Int, NetworkError>) -> Void)) {

    }

    func like(petId: String, completion: ((Result<Void, NetworkError>) -> Void)?) {

    }

    func dislike(petId: String, completion: ((Result<Void, NetworkError>) -> Void)?) {

    }

    func getLikedPets(completion: @escaping (Result<[Pet], NetworkError>) -> Void) {

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
      var headers = request.allHTTPHeaderFields ?? [String: String]()
      headers["Authorization"] = userToken
      request.allHTTPHeaderFields = headers
    }
}
