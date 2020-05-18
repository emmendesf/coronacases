//
//  TabbarCoordinator.swift
//  CovidCases
//
//  Created by Caio Roberto on 17/05/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

import UIKit

class TabbarCoordinator: RootCoordinator {

    var nextCoordinator: Coordinator?
    var coordinators: [Coordinator] = []

    var currentViewController: UIViewController?
    var presentingViewController: UINavigationController
    var tabbarController: UITabBarController

    init(presentingViewController: UINavigationController) {
        self.tabbarController = TabbarController()
        self.presentingViewController = presentingViewController
    }

    func loadViewController() -> UIViewController {
        self.coordinators = configureTabBar()
        return tabbarController
    }

    func configureTabBar() -> [Coordinator] {
        let mainScreenCoordinator = TabbarItems.createMainScreenTabItem(tabbarController)
        let preventionTipsCoordinator = TabbarItems.createPreventionTipsTabItem(tabbarController)
        let aboutCoordinator = TabbarItems.createAboutTabItem(tabbarController)

        return [mainScreenCoordinator, preventionTipsCoordinator, aboutCoordinator]
    }

    func toUpdateIsNavigationBarHidden() -> Bool? {
        return true
    }
}
