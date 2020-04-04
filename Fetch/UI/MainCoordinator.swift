//
//  Coordinator.swift
//  Fetch
//
//  Created by yi.hao on 3/19/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import UIKit
import Intrepid

final class MainCoordinator: NSObject {

    private(set) var navigationController: UINavigationController?

    func start() {
        let rootViewController = LoginViewController()
        rootViewController.coordinator = self
        self.navigationController = UINavigationController(rootViewController: rootViewController)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    func showLoginScreen(animated: Bool) {
        let loginViewController = LoginViewController()
        loginViewController.coordinator = self
        navigationController?.pushViewController(loginViewController, animated: animated)
    }

    func showOnboardingScreen(animated: Bool) {
        let viewModel = OnboardingViewModel(flow: OnboardingQuestions.load())
        let onboardingViewController = OnboardingViewController(viewModel: viewModel)
        onboardingViewController.coordinator = self
        navigationController?.pushViewController(onboardingViewController, animated: animated)
    }

    func showHomeScreen(animated: Bool) {
        let viewModel = HomeViewModel(networkManager: MockNetworkManager(fileName: "pets"))
        let homeViewController = HomeViewController(viewModel: viewModel)
        homeViewController.coordinator = self
        navigationController?.pushViewController(homeViewController, animated: animated)
    }
}
