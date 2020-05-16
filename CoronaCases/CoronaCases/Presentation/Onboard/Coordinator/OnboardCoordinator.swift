//  OnboardCoordinator.swift
//  CovidCases
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
}

extension OnboardCoordinator: OnboardViewModelCoordinatorDelegate {
    func showLocationPermission() {
//        let coordinator = LocationPermissionCoordinator(presentingViewController: presentingViewController)
        let coordinator = AboutCoordinator(presentingViewController: presentingViewController)
//        let coordinator = PreventionTipsCoordinator.init(presentingViewController: presentingViewController)
        coordinator.start()
        nextCoordinator = coordinator
    }
}
