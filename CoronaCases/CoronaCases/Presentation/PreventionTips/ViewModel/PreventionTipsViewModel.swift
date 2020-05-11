//
//  PreventionTipsViewModel.swift
//  CovidCases
//
//  Created by Caio Roberto on 10/05/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

import UIKit

class PreventionTipsViewModel {
    
    func allPreventionScreens() -> [StaticSlidableScreen] {
        return [slidableScreen(from: .avoidCloseContact),
                slidableScreen(from: .avoidTouchingFace),
                slidableScreen(from: .coverNoseAndMouth),
                slidableScreen(from: .stayHome),
                slidableScreen(from: .washHands)]
    }
    
    private func slidableScreen(from tip: PreventionTips) -> StaticSlidableScreen {
        return StaticSlidableScreen(contentView: tip.view)
    }
}
