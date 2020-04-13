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

    private let viewModel: LoginViewModel

    var newUserDidLogin: (() -> Void)?
    var oldUserDidLogin: (() -> Void)?

    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "LoginViewController", bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().delegate = viewModel
        viewModel.delegate = self
        GIDSignIn.sharedInstance()?.presentingViewController = self
        googleSignInButton.layer.applyGoogleSignInButtonShadow()
        googleSignInButton.isHidden = true
        viewModel.checkCachedUserOnboardingStatus()
    }

    @IBAction private func googleSignInButtonTapped(_ sender: Any) {
        GIDSignIn.sharedInstance().signIn()
    }
}

extension LoginViewController: LoginViewModelDelegate {
    func storeTokenCheckComplete() {
        googleSignInButton.isHidden = false
    }
}
