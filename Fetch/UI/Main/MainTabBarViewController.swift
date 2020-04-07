//
//  MainTabBarViewController.swift
//  Fetch
//
//  Created by yi.hao on 4/6/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    private let viewModel: MainTabBarViewModel

    init (viewModel: MainTabBarViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "MainTabBarViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
}

extension MainTabBarViewController: MainTabBarViewModelDelegate {
    func selectionDidChange(to index: Int) {
        <#code#>
    }

    func likedCountDidChange(to count: Int) {
        <#code#>
    }

    
}
