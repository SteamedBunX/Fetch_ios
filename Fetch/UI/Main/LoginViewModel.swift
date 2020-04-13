//
//  LoginViewModel.swift
//  Fetch
//
//  Created by yi.hao on 4/13/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import Foundation
import GoogleSignIn

protocol LoginViewModelDelegate: AnyObject {

    var newUserDidLogin: (() -> Void)? { get set }
    var oldUserDidLogin: (() -> Void)? { get set }
    func storeTokenCheckComplete()
}

final class LoginViewModel: NSObject {
    private let networkManager: GraphQLNetworkManager
    private let userDefaults = UserDefaults.standard
    private let userDefaultsUserTokenKey = "userToken"
    weak var delegate: LoginViewModelDelegate?

    private var cachedUserToken: String? {
        return userDefaults.string(forKey: userDefaultsUserTokenKey)
    }

    init(networkManager: GraphQLNetworkManager) {
        self.networkManager = networkManager
    }

    func checkUserOnboardingStatus() {
        guard let userToken = cachedUserToken else {
            delegate?.storeTokenCheckComplete()
            return
        }
        networkManager.userToken = userToken
        networkManager.checkUserOnboardingStatus { [weak self] finishedOnboarding in
            if finishedOnboarding {
                self?.delegate?.oldUserDidLogin?()
            } else {
                self?.delegate?.storeTokenCheckComplete()
            }
        }
    }

    private func userDidSignInWithGoogle(for user: GIDGoogleUser) {
        let authenticationInfo = AuthInput(clientId: user.authentication.clientID, idToken: user.authentication.idToken)
        networkManager.login(authenticationInfo: authenticationInfo) { [weak self] result in
            self?.storeUserToken(userToken: result)
            self?.networkManager.checkUserOnboardingStatus { [weak self] finishedOnboarding in
                if finishedOnboarding {
                    self?.delegate?.oldUserDidLogin?()
                } else {
                    self?.delegate?.newUserDidLogin?()
                }
            }
        }
    }

    private func storeUserToken(userToken: String) {
        userDefaults.setValue(userToken, forKey: userDefaultsUserTokenKey)
    }
}

extension LoginViewModel: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn?, didSignInFor user: GIDGoogleUser?, withError error: Error?) {
        if let user = user {
            self.userDidSignInWithGoogle(for: user)
        }
    }
}
