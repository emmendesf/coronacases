//
//  PreventionTipsCoordinator.swift
//  CovidCases
//
//  Created by Caio Roberto on 11/05/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

import UIKit

class PreventionTipsCoordinator: PushedCoordinator {
    var presentingViewController: UINavigationController
    var currentViewController: UIViewController?
    var nextCoordinator: Coordinator?
    
    init(presentingViewController: UINavigationController) {
        self.presentingViewController = presentingViewController
    }
    
    func loadViewController() -> UIViewController {
        let viewModel = PreventionTipsViewModel()
        return PreventionTipsViewController(viewModel: viewModel)
    }
}
