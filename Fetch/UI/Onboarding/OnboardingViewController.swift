//
//  OnboardingViewController.swift
//  Fetch
//
//  Created by yi.hao on 3/18/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import UIKit

final class OnboardingViewController: UIViewController {

    @IBOutlet var progressBarView: ProgressBarView!

    weak var coordinator: MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func backButtonTapped(_ sender: UIButton) {
        progressBarView.return()
    }

    @IBAction func nextButtonTapped(_ sender: UIButton) {
        progressBarView.progress()
    }

}
