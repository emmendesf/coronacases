//
//  MainScreenCoordinator .swift
//  CovidCases
//
//  Created by Caio Roberto on 28/03/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

import UIKit

class MainScreenCoordinator: PushedCoordinator {
    var presentingViewController: UINavigationController
    var currentViewController: UIViewController?
    var nextCoordinator: Coordinator?
    var location: Placemark?
    
    init(presentingViewController: UINavigationController, location: Placemark?) {
        self.presentingViewController = presentingViewController
        self.location = location
    }
    
    func loadViewController() -> UIViewController {
        let viewModel = MainScreenViewModel(coordinatorDelegate: self)
        return MainScreenViewController(viewModel: viewModel)
    }
}

extension MainScreenCoordinator: MainScreenViewModelCoordinatorDelegate {
    
}
