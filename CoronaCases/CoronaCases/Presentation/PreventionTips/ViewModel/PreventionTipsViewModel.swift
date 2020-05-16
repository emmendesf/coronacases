//
//  PreventionTipsViewModel.swift
//  CovidCases
//
//  Created by Caio Roberto on 10/05/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

import UIKit

class PreventionTipsViewModel {
    let pages: [UIViewController] = allPreventionScreens()
    
    static func allPreventionScreens() -> [StaticSlidableScreen] {
        return [slidableScreen(from: .avoidCloseContact),
                slidableScreen(from: .avoidTouchingFace),
                slidableScreen(from: .coverNoseAndMouth),
                slidableScreen(from: .stayHome),
                slidableScreen(from: .washHands)]
    }
    
    private static func slidableScreen(from tip: PreventionTips) -> StaticSlidableScreen {
        return StaticSlidableScreen(contentView: tip.view)
    }
}
