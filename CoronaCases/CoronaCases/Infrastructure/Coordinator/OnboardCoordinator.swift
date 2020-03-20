//  OnboardCoordinator.swift
//  CoronaCases
//
//  Created by Caio Roberto on 20/03/20.
//  Copyright (c) 2020 Emerson Mendes Filho. All rights reserved.

import UIKit

class OnboardCoordinator: PushedCoordinator {

    var presentingViewController: UINavigationController
    var nextCoordinator: Coordinator?
    var currentViewController: UIViewController?

    init(presentingViewController: UINavigationController) {
        self.presentingViewController = presentingViewController
    }

    func loadViewController() -> UIViewController {
        let viewModel = OnboardViewModel(coordinatorDelegate: self)
        let viewController = OnboardViewController(viewModel: viewModel)
        return viewController
    }

    func toUpdateIsBottomBarHidden() -> Bool? {
        return true
    }
}

extension OnboardCoordinator: OnboardViewModelCoordinatorDelegate {

}
