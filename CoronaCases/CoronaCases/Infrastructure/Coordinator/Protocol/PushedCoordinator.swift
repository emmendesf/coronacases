//
//  PushedCoordinator.swift
//  CovidCases
//
//  Created by Emerson Mendes Filho on 14/03/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

import UIKit

protocol PushedCoordinator: ShowedCoordinator {
    var presentingViewController: UINavigationController { get }
}

extension PushedCoordinator {
    func show(viewController: UIViewController, animated: Bool) {
        currentViewController = viewController
        presentingViewController.pushViewController(viewController, animated: animated)
    }
}
