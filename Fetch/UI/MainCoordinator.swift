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
    private let networkManager: NetworkManager = MockNetworkManager(fileName: "pets")

    private var newLoginViewController: LoginViewController {
        let loginViewController = LoginViewController()
        loginViewController.newUserDidLogin = { [weak self] in
            self?.showOnboardingScreen(animated: true)
        }
        loginViewController.oldUserDidLogin = { [weak self] in
            self?.showMainTabBarView(animated: true)
        }

        loginViewController.skipLogin = { [weak self] in
            self?.showMainTabBarView(animated: true)
        }
        return loginViewController
    }

    func start() {
        let rootViewController = newLoginViewController
        self.navigationController = UINavigationController(rootViewController: rootViewController)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    private func showLoginScreen(animated: Bool) {
        let loginViewController = newLoginViewController
        navigationController?.pushViewController(loginViewController, animated: animated)
    }

    private func showOnboardingScreen(animated: Bool) {
        let viewModel = OnboardingViewModel(flow: OnboardingQuestions.load())
        let onboardingViewController = OnboardingViewController(viewModel: viewModel)
        onboardingViewController.didFinishSequence = { [weak self] in
            self?.showMainTabBarView(animated: true)
        }
        navigationController?.pushViewController(onboardingViewController, animated: animated)
    }

    private func showMainTabBarView(animated: Bool) {
        let viewModel = MainTabBarViewModel(networkManager: networkManager)
        let tabBarViewController = MainTabBarViewController(viewModel: viewModel)
        tabBarViewController.modalTransitionStyle = .crossDissolve
        tabBarViewController.modalPresentationStyle = .fullScreen
        navigationController?.present(tabBarViewController, animated: animated)
    }
}
