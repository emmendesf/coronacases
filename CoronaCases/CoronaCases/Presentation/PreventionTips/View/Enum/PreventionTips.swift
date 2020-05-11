//
//  PreventionTips.swift
//  CovidCases
//
//  Created by Caio Roberto on 10/05/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

import UIKit

enum PreventionTips: CaseIterable {
    case washHands
    case coverNoseAndMouth
    case avoidCloseContact
    case avoidTouchingFace
    case stayHome
    
    var view: UIView {
        switch self {
        case .washHands:
            return TipView(image: R.image.washHands() ?? UIImage(), tip: R.string.localizable.preventionTipsWashHands())
        case .coverNoseAndMouth:
            return TipView(image: R.image.coverNoseAndMouth() ?? UIImage(), tip: R.string.localizable.preventionTipsCoverNoseAndMouth())
        case .avoidCloseContact:
            return TipView(image: R.image.avoidCloseContactCustom() ?? UIImage(), tip: R.string.localizable.preventionTipsAvoidCloseContact())
        case .avoidTouchingFace:
            return TipView(image: R.image.avoidTouchingFace() ?? UIImage(), tip: R.string.localizable.preventionTipsAvoidTouchingFace())
        case .stayHome:
            return TipView(image: R.image.stayHome() ?? UIImage(), tip: R.string.localizable.preventionTipsStayHome())
        }
    }
}
