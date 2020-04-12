//
//  LoginViewController.swift
//  Fetch
//
//  Created by yi.hao on 3/19/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import UIKit
import GoogleSignIn

final class LoginViewController: UIViewController {

    @IBOutlet private var googleSignInButton: RoundButton!

    let networkManager = GraphQLNetworkManager.shared
    let userDefaults = UserDefaults.standard
    let userDefaultsTokan = "userTokan"

    var newUserDidLogin: (() -> Void)?
    var oldUserDidLogin: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let userTokan = checkForUserTokan() {
            googleSignInButton.isHidden = true
            networkManager.userTokan = userTokan
            networkManager.checkUserOnboardingStatus { [weak self] finishedOnboarding in
                if finishedOnboarding {
                    self?.oldUserDidLogin?()
                } else {
                    self?.googleSignInButton.isHidden = false
                }
            }
        }
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance()?.presentingViewController = self
        googleSignInButton.layer.applyGoogleSignInButtonShadow()
    }

    @IBAction private func googleSignInButtonTapped(_ sender: Any) {
        GIDSignIn.sharedInstance().signIn()
    }

    private func userDidSignInWithGoogle(for user: GIDGoogleUser) {
        let authenticationInfo = AuthInput(clientId: user.authentication.clientID, idToken: user.authentication.idToken)
        networkManager.login(authenticationInfo: authenticationInfo) { [weak self] result in
            self?.storeUserTokan(userTokan: result)
        }
        networkManager.checkUserOnboardingStatus { [weak self] finishedOnboarding in
            if finishedOnboarding {
                self?.oldUserDidLogin?()
            } else {
                self?.newUserDidLogin?()
            }
        }
    }

    private func storeUserTokan(userTokan: String) {
        userDefaults.setValue(userTokan, forKey: userDefaultsTokan)
    }

    private func checkForUserTokan() -> String? {
        return userDefaults.string(forKey: userDefaultsTokan)
    }
}

extension LoginViewController: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn?, didSignInFor user: GIDGoogleUser?, withError error: Error?) {
        if let user = user {
            self.userDidSignInWithGoogle(for: user)
        }
    }
}
