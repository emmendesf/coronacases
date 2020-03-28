//  MainScreenCoordinator.swift
//  CovidCases
//
//  Copyright (c) 2020 A7&M. All rights reserved.

import UIKit

class MainScreenCoordinator: PushedCoordinator {

    var presentingViewController: UINavigationController
    var nextCoordinator: Coordinator?
    var currentViewController: UIViewController?

    init(presentingViewController: UINavigationController) {
        self.presentingViewController = presentingViewController
    }

    func loadViewController() -> UIViewController {
        let viewModel = MainScreenViewModel(coordinatorDelegate: self)
        let viewController = MainScreenViewController(viewModel: viewModel)
        return viewController
    }

    func toUpdateIsBottomBarHidden() -> Bool? {
        return true
    }
}

extension MainScreenCoordinator: MainScreenViewModelCoordinatorDelegate {

}
