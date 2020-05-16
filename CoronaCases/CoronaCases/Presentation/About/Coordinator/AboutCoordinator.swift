//
//  AboutCoordinator.swift
//  CovidCases
//
//  Created by Caio Roberto on 11/05/20.
//  Copyright (c) 2020 A7&M. All rights reserved.
//

import UIKit

class AboutCoordinator: PushedCoordinator {

    var presentingViewController: UINavigationController
    var nextCoordinator: Coordinator?
    var currentViewController: UIViewController?

    init(presentingViewController: UINavigationController) {
        self.presentingViewController = presentingViewController
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
