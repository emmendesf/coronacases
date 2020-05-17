//
//  CovidCasesCoordinator.swift
//  CovidCases
//
//  Created by Caio Roberto on 28/03/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

import UIKit

class CovidCasesCoordinator: PushedCoordinator {
    var presentingViewController: UINavigationController
    var currentViewController: UIViewController?
    var nextCoordinator: Coordinator?
    private let location: Placemark?
    
    init(presentingViewController: UINavigationController, location: Placemark?) {
        self.presentingViewController = presentingViewController
        self.location = location
    }
    
    func loadViewController() -> UIViewController {
        let presenter = CovidCasesPresenter(coordinatorDelegate: self)
        return CovidCasesViewController(presenter: presenter)
    }
}

extension CovidCasesCoordinator: CovidCasesCoordinatorContract {
    
}
