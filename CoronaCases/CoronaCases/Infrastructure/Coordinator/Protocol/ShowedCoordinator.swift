//
//  ShowedCoordinator.swift
//  CoronaCases
//
//  Created by Emerson Mendes Filho on 14/03/20.
//  Copyright © 2020 Emerson Mendes Filho. All rights reserved.
//

import UIKit

protocol ShowedCoordinator: Coordinator {
    var currentViewController: UIViewController? { get set }
    func loadViewController() -> UIViewController
    func isNavigationBarHidden() -> Bool
    func isTabBarBarHidden() -> Bool
    func show(viewController: UIViewController, animated: Bool)
}

extension ShowedCoordinator {
    func start(animated: Bool = true) {
        let viewController = loadViewController()
        viewController.hidesBottomBarWhenPushed = isTabBarBarHidden()
        
        show(viewController: viewController, animated: animated)
    }
    
    func isNavigationBarHidden() -> Bool {
        return false
    }
    
    func isTabBarBarHidden() -> Bool {
           return false
    }
}
