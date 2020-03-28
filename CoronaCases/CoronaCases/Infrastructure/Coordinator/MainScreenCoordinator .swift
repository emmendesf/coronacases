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
    
    init(presentingViewController: UINavigationController) {
        self.presentingViewController = presentingViewController
    }
    
    func loadViewController() -> UIViewController {
        let viewModel = MainScreenViewModel()
        return MainScreenViewController(viewModel: viewModel)
    }
}
