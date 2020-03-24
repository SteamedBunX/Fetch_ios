//
//  Coordinator.swift
//  Fetch
//
//  Created by yi.hao on 3/19/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import Foundation
import UIKit
import GoogleSignIn

class MainCoordinator: NSObject, GIDSignInDelegate {
    private(set) var navigationController: UINavigationController?
    private(set) var currentViewController: UIViewController?

    let googleSigninClientID = "615918356762-f3bkobjmofq52radc9fvvccfb7gfc6t1.apps.googleusercontent.com"

    func start() {
        let rootViewController = LoginViewController()
        rootViewController.coordinator = self
        currentViewController = rootViewController
        self.navigationController = UINavigationController(rootViewController: rootViewController)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    func showLoginScreen(animated: Bool) {
        let loginViewController = LoginViewController()
        currentViewController = loginViewController
        loginViewController.coordinator = self
        navigationController?.pushViewController(loginViewController, animated: animated)
    }

    func showOnboardingScreen(animated: Bool) {
        let onboardingViewController = OnboardingViewController()
        currentViewController = onboardingViewController
        onboardingViewController.coordinator = self
        navigationController?.pushViewController(onboardingViewController, animated: animated)
    }

    // MARK: - Google Sign In

    func setupGoogleSignIn() {
        GIDSignIn.sharedInstance().clientID = googleSigninClientID
        GIDSignIn.sharedInstance().delegate = self
    }

    func userDidSignInWithGoogle(for user: GIDGoogleUser) {
        // Perform any operations on signed in user here.
        // keeping the variables for referance until the login architecture is complete.
        // let userId = user.userID                  // For client-side use only!
        // let idToken = user.authentication.idToken // Safe to send to the server
        // let fullName = user.profile.name
        // let givenName = user.profile.givenName
        // let familyName = user.profile.familyName
        // let email = user.profile.email

        // temporarilly display the user has signed in with some information.
        if !(self.currentViewController?.isViewLoaded ?? false) {
            return
        }
        let alertController =
            UIAlertController(title: "Login Successful",
                              message: "User did sign in\nEmail: \(user.profile.email ?? "Error")\nName: \(user.profile.name ?? "Error")",
                              preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        DispatchQueue.main.async {
            self.currentViewController?
                .present(alertController,
                         animated: true,
                         completion: nil)
        }
    }

    func sign(_ signIn: GIDSignIn?, didSignInFor user: GIDGoogleUser?, withError error: Error?) {
        if let user = user {
            userDidSignInWithGoogle(for: user)
        }
    }
}
