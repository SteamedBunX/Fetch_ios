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
    private let networkManager: NetworkManager
    private let userDefaults = UserDefaults.standard
    weak var delegate: LoginViewModelDelegate?

    private var hasCacheToken: Bool {
        return userDefaults.string(forKey: UserDefaultsKeys.userToken) != nil
    }

    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }

    func checkCachedUserOnboardingStatus() {
        guard hasCacheToken else {
            delegate?.storeTokenCheckComplete()
            return
        }
        networkManager.checkUserOnboardingStatus { [weak self] result in
            switch result {
            case .success(let finishedOnboarding):
                if finishedOnboarding {
                    self?.delegate?.oldUserDidLogin?()
                } else {
                    self?.delegate?.storeTokenCheckComplete()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    private func userDidSignInWithGoogle(for user: GIDGoogleUser) {
        let authenticationInfo = AuthInput(clientId: user.authentication.clientID, idToken: user.authentication.idToken)
        networkManager.login(authenticationInfo: authenticationInfo) { [weak self] result in
            switch result {
            case .success:
                self?.handleSuccessfulLogin()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    private func handleSuccessfulLogin() {
        networkManager.checkUserOnboardingStatus {  [weak self] result in
            switch result {
            case .success(let finishedOnboarding):
                if finishedOnboarding {
                    self?.delegate?.oldUserDidLogin?()
                } else {
                    self?.delegate?.newUserDidLogin?()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension LoginViewModel: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn?, didSignInFor user: GIDGoogleUser?, withError error: Error?) {
        if let user = user {
            userDidSignInWithGoogle(for: user)
        }
    }
}
