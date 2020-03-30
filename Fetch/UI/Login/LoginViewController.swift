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

    weak var coordinator: MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
    }

    @IBAction func googleSignInButtonTapped(_ sender: Any) {
        GIDSignIn.sharedInstance().signIn()
    }

    private func userDidSignInWithGoogle(for user: GIDGoogleUser) {
        // TODO: The login isn't fully complete here.
        // We still need to hit the Fetch backend with our google auth results and get a user JWT to store locally
        // when they have that functionality finished.
        coordinator?.showOnboardingScreen(animated: true)
    }

    // Shake device to skip login for demo purposes. Removed before merge.
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        coordinator?.showOnboardingScreen(animated: true)
    }
}

extension LoginViewController: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn?, didSignInFor user: GIDGoogleUser?, withError error: Error?) {
        if let user = user {
            self.userDidSignInWithGoogle(for: user)
        }
    }
}
