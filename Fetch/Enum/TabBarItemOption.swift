//
//  TabBarItemOption.swift
//  Fetch
//
//  Created by yi.hao on 4/9/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import UIKit

enum TabBarItemOption: Int {
    case setting = 0, home = 1, liked = 2

    var icon: UIImage {
        switch self {
        case .setting:
            return #imageLiteral(resourceName: "main_settingTabButton")
        case .home:
            return #imageLiteral(resourceName: "main_homeTabButton")
        case .liked:
            return #imageLiteral(resourceName: "main_likedTabButton")
        }
    }
}
