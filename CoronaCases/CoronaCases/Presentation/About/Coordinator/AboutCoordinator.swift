//
//  AboutCoordinator.swift
//  CovidCases
//
//  Created by Caio Roberto on 11/05/20.
//  Copyright (c) 2020 A7&M. All rights reserved.
//

import UIKit

class AboutCoordinator: InTabBarCoordinator {
    var tabBarController: UITabBarController
    var item: UITabBarItem
    

    var presentingViewController: UINavigationController?
    var nextCoordinator: Coordinator?
    var currentViewController: UIViewController?

    init(tabBarController: UITabBarController, item: UITabBarItem) {
        self.tabBarController = tabBarController
        self.item = item
    }

    func loadViewController() -> UIViewController {
        let viewModel = AboutViewModel(coordinatorDelegate: self)
        let viewController = AboutViewController(viewModel: viewModel)
        return viewController
    }

    func toUpdateIsBottomBarHidden() -> Bool? {
        return true
    }
}

extension AboutCoordinator: AboutViewModelCoordinatorDelegate {

}
