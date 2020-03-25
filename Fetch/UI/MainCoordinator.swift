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

class MainCoordinator: NSObject {
    private(set) var navigationController: UINavigationController?
    private(set) var currentViewController: UIViewController?

    private let googleSigninClientID = "615918356762-f3bkobjmofq52radc9fvvccfb7gfc6t1.apps.googleusercontent.com"

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
            self.currentViewController?.present(alertController,
                                                animated: true,
                                                completion: nil)
        }
    }
}

extension MainCoordinator: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn?, didSignInFor user: GIDGoogleUser?, withError error: Error?) {
        if let user = user {
            self.userDidSignInWithGoogle(for: user)
        }
    }
}
