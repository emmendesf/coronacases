//
//  LocationPermissionCoordinator.swift
//  CovidCases
//
//  Created by Emerson Mendes Filho on 14/03/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

import UIKit

class LocationPermissionCoordinator: PushedCoordinator {
    var presentingViewController: UINavigationController
    var currentViewController: UIViewController?
    var nextCoordinator: Coordinator?
    
    init(presentingViewController: UINavigationController) {
        self.presentingViewController = presentingViewController
    }
    
    func loadViewController() -> UIViewController {
        let viewModel = LocationPermissionViewModel()
        return LocationPermissionViewController(viewModel: viewModel)
    }
}
