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
    private lazy var apollo = ApolloClient(networkTransport: self.networkTransport)
    private let userDefaults = UserDefaults.standard
    private var userToken: String {
        return userDefaults.string(forKey: UserDefaultsKeys.userToken) ?? ""
    }

    private init() {}

    func login(authenticationInfo: AuthInput, completion: @escaping (Result<Void, NetworkError>) -> Void) {
        apollo.perform(mutation: LoginMutation(auth: authenticationInfo)) {[weak self] result in
            switch result {
            case .success(let response):
                guard let resultToken = response.data?.createUser?.token else {
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

    func getUserOnboardingStatus(completion: @escaping (Result<Bool, NetworkError>) -> Void) {
        apollo.fetch(query: IsUserOnboardedQuery()) { result in
            switch result {
            case .success(let response):
                completion(.success(response.data?.currentUser.petSizePreference != nil))
            case .failure(let error):
                completion(.failure(.unknownError(error)))
            }
        }
    }

    func getRandomPet(withCurrentList list: [String], completion: @escaping ((Result<Pet, NetworkError>) -> Void)) {
        let queuedPets = list.map { (id) -> GraphQLID in
            GraphQLID(id)
        }
        apollo.fetch(query: GetRandomPetQuery(queuedPets: queuedPets)) { result in
            switch result {
            case .success(let response):
                guard let petDecodable = response.data?.randomPet else {
                    completion(.failure(.failToDecodeData))
                    return
                }
                let resultPet = GraphQLCoder.getPet(from: petDecodable)
                completion(.success(resultPet))
            case .failure(let error):
                completion(.failure(.unknownError(error)))
            }
        }
    }

    func getLikedCount(completion: ((Result<Int, NetworkError>) -> Void)) {

    }

    func like(petId: String, completion: ((Result<Void, NetworkError>) -> Void)?) {
        apollo.perform(mutation: LikePetMutation(petId: petId)) { result in
            switch result {
            case .success(_):
                completion?(.success(()))
            case .failure(let error):
                completion?(.failure(.unknownError(error)))
            }
        }
    }

    func dislike(petId: String, completion: ((Result<Void, NetworkError>) -> Void)?) {
        apollo.perform(mutation: DislikePetMutation(petId: petId)) { result in
            switch result {
            case .success(_):
                completion?(.success(()))
            case .failure(let error):
                completion?(.failure(.unknownError(error)))
            }
        }
    }

    func getLikedPets(completion: @escaping (Result<[Pet], NetworkError>) -> Void) {

    }

    private func storeUserToken(userToken: String) {
        userDefaults.setValue(userToken, forKey: UserDefaultsKeys.userToken)
    }
}

extension GraphQLNetworkManager: HTTPNetworkTransportPreflightDelegate {

    func networkTransport(_ networkTransport: HTTPNetworkTransport, shouldSend request: URLRequest) -> Bool {
        return request.url?.absoluteString == endPoint
    }

    func networkTransport(_ networkTransport: HTTPNetworkTransport,
                          willSend request: inout URLRequest) {
      var headers = request.allHTTPHeaderFields ?? [String: String]()
      headers["Authorization"] = userToken
      request.allHTTPHeaderFields = headers
    }
}
