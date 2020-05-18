//
//  TabbarItems.swift
//  CovidCases
//
//  Created by Caio Roberto on 17/05/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

import UIKit

enum TabbarItems: Int {
    case mainScreen
    case preventionTips
    case about

    static let imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: 0, right: 0)

    static func createMainScreenTabItem(_ tabbarController: UITabBarController) -> CovidCasesCoordinator {
        let image = R.image.worldTabIcon()?.withRenderingMode(.alwaysOriginal)
        let selectedImage = R.image.worldTabIconActive()?.withRenderingMode(.alwaysOriginal)
        let mainScreenItem = UITabBarItem(title: "Casos", image: image, selectedImage: selectedImage)
        mainScreenItem.imageInsets = TabbarItems.imageInsets
        let mainScreenCoordinator = CovidCasesCoordinator(tabBarController: tabbarController,
                                                     item: mainScreenItem)
        mainScreenCoordinator.start()
        
        return mainScreenCoordinator
    }

    static func createPreventionTipsTabItem(_ tabbarController: UITabBarController) -> PreventionTipsCoordinator {
        let image = R.image.preventionTabIcon()?.withRenderingMode(.alwaysOriginal)
        let selectedImage = R.image.preventionTabIconActive()?.withRenderingMode(.alwaysOriginal)
        let preventionTipsItem = UITabBarItem(title: "Prevenção", image: image, selectedImage: selectedImage)
        preventionTipsItem.imageInsets = TabbarItems.imageInsets
        let preventionTipsCoordinator = PreventionTipsCoordinator(tabBarController: tabbarController,
                                                                  item: preventionTipsItem)
        preventionTipsCoordinator.start()
        
        return preventionTipsCoordinator
    }

    static func createAboutTabItem(_ tabbarController: UITabBarController) -> AboutCoordinator {
        let image = R.image.aboutTabIcon()?.withRenderingMode(.alwaysOriginal)
        let selectedImage = R.image.aboutTabIconActive()?.withRenderingMode(.alwaysOriginal)
        let aboutItem = UITabBarItem(title: "Sobre", image: image, selectedImage: selectedImage)
        aboutItem.imageInsets = TabbarItems.imageInsets
        let aboutCoordinator = AboutCoordinator(tabBarController: tabbarController,
                                                                  item: aboutItem)
        aboutCoordinator.start()
        
        return aboutCoordinator
    }
}
