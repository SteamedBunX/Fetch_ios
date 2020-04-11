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

    var newUserDidLogin: (() -> Void)?
    var oldUserDidLogin: (() -> Void)?
    var skipLogin: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance()?.presentingViewController = self
        googleSignInButton.layer.applyGoogleSignInButtonShadow()
    }

    @IBAction private func googleSignInButtonTapped(_ sender: Any) {
        GIDSignIn.sharedInstance().signIn()
    }

    private func userDidSignInWithGoogle(for user: GIDGoogleUser) {
        // TODO: Communicate with server for the actual tokan.
        // TODO: Cache tokan locally and use it instead of the google auth when possible.
        newUserDidLogin?()
    }

    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        super.motionEnded(motion, with: event)
        skipLogin?()
    }
}

extension LoginViewController: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn?, didSignInFor user: GIDGoogleUser?, withError error: Error?) {
        if let user = user {
            self.userDidSignInWithGoogle(for: user)
        }
    }
}
