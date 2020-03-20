//
//  AppCoordinator.swift
//  CoronaCases
//
//  Created by Emerson Mendes Filho on 14/03/20.
//  Copyright © 2020 Emerson Mendes Filho. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    
    var nextCoordinator: Coordinator?
    var currentViewController: UIViewController?
    var presentingViewController: UINavigationController

    init(presentingViewController: UINavigationController) {
        self.presentingViewController = presentingViewController
    }

    func start(animated: Bool) {
//        let coordinator = LocationPermissionCoordinator(presentingViewController: presentingViewController)
        let coordinator = OnboardCoordinator(presentingViewController: presentingViewController)
        coordinator.start()
        nextCoordinator = coordinator
    }
}

