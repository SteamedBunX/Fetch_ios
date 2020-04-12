//
//  GraphQLNetworkManager.swift
//  Fetch
//
//  Created by yi.hao on 4/9/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import Foundation
import Apollo

final class GraphQLNetworkManager {

    static let shared = GraphQLNetworkManager()
    private(set) lazy var apollo = ApolloClient(url: URL(string: "https://fetch-server-staging.herokuapp.com/")!)
    var userTokan = ""

    private init() {}

    func login(authenticationInfo: AuthInput, completion: @escaping (String) -> Void) {
        apollo.perform(mutation: LoginMutation(auth: authenticationInfo)) { [weak self] result in
            switch result {
            case .success(let resultData):
                self?.userTokan = resultData.data?.createUser?.token ?? ""
                completion(self?.userTokan ?? "")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    func checkUserOnboardingStatus(completion: @escaping (Bool) -> Void) {
        apollo.fetch(query: UserIsOnboardedQuery()) { result in
            switch result {
            case .success(let resultData):
                completion(!(resultData.data?.currentUser.petSizePreference == nil))
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
