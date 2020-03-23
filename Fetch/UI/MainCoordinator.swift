//
//  Coordinator.swift
//  Fetch
//
//  Created by yi.hao on 3/19/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import Foundation
import UIKit

class MainCoordinator {
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func showLoginScreen() {
        let loginViewController = LoginViewController()
        loginViewController.coordinator = self
        navigationController.pushViewController(loginViewController, animated: true)
    }

    func startOnboarding() {
        let onboardingViewController = OnboardingViewController()
        onboardingViewController.coordinator = self
        navigationController.pushViewController(onboardingViewController, animated: true)
    }
}
