//
//  InTabBarCoordinator.swift
//  CovidCases
//
//  Created by Caio Roberto on 17/05/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

import UIKit

protocol InTabBarCoordinator: ShowedCoordinator {
    var presentingViewController: UINavigationController? { get set }
    var tabBarController: UITabBarController { get }
    var item: UITabBarItem { get }
}

extension InTabBarCoordinator {

    func show(viewController: UIViewController, animated: Bool) {
        wrapViewControllerOnNavigation(viewController)
        configureViewControllerItem()
        appendViewControllerOnTabbar()
    }

    func select(tab: TabbarItems) {
        tabBarController.selectedIndex = tab.rawValue
    }

    private func wrapViewControllerOnNavigation(_ viewController: UIViewController) {
        let navigationController = UINavigationController(rootViewController: viewController)
        presentingViewController = navigationController
        currentViewController = viewController
    }

    private func configureViewControllerItem() {
        currentViewController?.tabBarItem = item
    }

    private func appendViewControllerOnTabbar() {
        guard let navigationController = presentingViewController else {
            fatalError("PresentingViewController should be previously created")
        }
        var viewControllers = tabBarController.viewControllers ?? []
        viewControllers.append(navigationController)
        tabBarController.setViewControllers(viewControllers, animated: true)
    }
}
