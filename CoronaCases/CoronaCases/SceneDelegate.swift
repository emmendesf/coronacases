//
//  SceneDelegate.swift
//  CovidCases
//
//  Created by Emerson Mendes Filho on 14/03/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    var appCoordinator: AppCoordinator?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else {
            return
        }
        setupCoordinator(windowScene)
    }
    
    private func setupCoordinator(_ windowScene: UIWindowScene) {
        let appWindow = UIWindow(frame: windowScene.coordinateSpace.bounds)
        appWindow.windowScene = windowScene
        let navigation = UINavigationController()
        appCoordinator = AppCoordinator(presentingViewController: navigation)
        appCoordinator?.start(animated: true)
        appWindow.rootViewController = navigation
        appWindow.makeKeyAndVisible()
        window = appWindow
    }
}

