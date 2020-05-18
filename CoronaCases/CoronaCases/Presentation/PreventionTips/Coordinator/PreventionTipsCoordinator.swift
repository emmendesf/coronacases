//
//  PreventionTipsCoordinator.swift
//  CovidCases
//
//  Created by Caio Roberto on 11/05/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

import UIKit

class PreventionTipsCoordinator: InTabBarCoordinator {
    var tabBarController: UITabBarController
    var item: UITabBarItem
    
    var presentingViewController: UINavigationController?
    var currentViewController: UIViewController?
    var nextCoordinator: Coordinator?
    
    init(tabBarController: UITabBarController, item: UITabBarItem) {
        self.tabBarController = tabBarController
        self.item = item
    }
    
    func loadViewController() -> UIViewController {
        let viewModel = PreventionTipsViewModel()
        return PreventionTipsViewController(viewModel: viewModel)
    }
}
