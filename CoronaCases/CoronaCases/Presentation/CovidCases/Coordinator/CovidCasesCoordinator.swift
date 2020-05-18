//
//  CovidCasesCoordinator.swift
//  CovidCases
//
//  Created by Caio Roberto on 28/03/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

import UIKit

class CovidCasesCoordinator: InTabBarCoordinator {
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
        let presenter = CovidCasesPresenter(coordinatorDelegate: self)
        return CovidCasesViewController(presenter: presenter)
    }
}

extension CovidCasesCoordinator: CovidCasesCoordinatorContract {
    
}
