//
//  TabbarController.swift
//  CovidCases
//
//  Created by Caio Roberto on 17/05/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

import UIKit

class TabbarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabbar()
    }
    
    private func configureTabbar() {
        tabBar.barTintColor = CustomColors.shared.coronaDarkGray
        tabBar.tintColor = CustomColors.shared.salmon
        tabBar.unselectedItemTintColor = CustomColors.shared.coronaLightGray
    }
}
