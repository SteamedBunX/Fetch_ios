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
        // TODO: Send user to Onboarding/Pet page if they're logged in.
        let alertController =
            UIAlertController(title: "Login Successful",
                              message: """
                                User did sign in
                                Email: \(user.profile.email ?? "Error")
                                Name: \(user.profile.name ?? "Error")
                                """,
                              preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        DispatchQueue.main.async {
            self.present(alertController,
                         animated: true,
                         completion: nil)
        }
    }
}

extension LoginViewController: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn?, didSignInFor user: GIDGoogleUser?, withError error: Error?) {
        if let user = user {
            self.userDidSignInWithGoogle(for: user)
        }
    }
}
