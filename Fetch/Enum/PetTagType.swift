//
//  TagType.swift
//  Fetch
//
//  Created by yi.hao on 4/1/20.
//  Copyright © 2020 Digital Products. All rights reserved.
//

import Foundation
import UIKit

enum PetTagType: Int, CaseIterable {
    case dependencyValue, activityValue, socialValue, trainabilityValue

    var color: UIColor {
        switch self {
        case .dependencyValue:
            return #colorLiteral(red: 0.1294117647, green: 0.3725490196, blue: 0.4745098039, alpha: 1) // 33, 95, 121
        case .activityValue:
            return #colorLiteral(red: 0.9019607843, green: 0.5607843137, blue: 0.2117647059, alpha: 1) // 230, 143, 54
        case .socialValue:
            return #colorLiteral(red: 0.4078431373, green: 0.3882352941, blue: 0.6392156863, alpha: 1) // 104, 99, 163
        case .trainabilityValue:
            return #colorLiteral(red: 0.3529411765, green: 0.5333333333, blue: 0.5529411765, alpha: 1) // 90, 136, 141
        }
    }

    var icon: UIImage {
        switch self {
        case .dependencyValue:
            return #imageLiteral(resourceName: "main_independenceTag")
        case .activityValue:
            return #imageLiteral(resourceName: "main_energyTag")
        case .socialValue:
            return #imageLiteral(resourceName: "main_socialbilityTag")
        case .trainabilityValue:
            return #imageLiteral(resourceName: "main_trainabilityTag")
        }
    }
}
