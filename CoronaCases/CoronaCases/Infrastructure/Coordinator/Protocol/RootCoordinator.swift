//
//  RootCoordinator.swift
//  CovidCases
//
//  Created by Caio Roberto on 17/05/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

import UIKit

protocol RootCoordinator: ShowedCoordinator {
    var presentingViewController: UINavigationController { get }
}

extension RootCoordinator {

    func show(viewController: UIViewController, animated: Bool) {
        currentViewController = viewController
        presentingViewController.viewControllers = [viewController]
    }

    func updateStatusBarVisibility() {
        presentingViewController.isNavigationBarHidden = isNavigationBarHidden()
    }
}
