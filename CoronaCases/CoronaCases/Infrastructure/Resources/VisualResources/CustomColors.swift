//
//  CustomColors.swift
//  CovidCases
//
//  Created by Caio Roberto on 17/03/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

import UIKit
class CustomColors: UIColor {
    static let shared = CovidColors()
}

struct CovidColors {
    let coronaDarkGray = UIColor(r: 45, g: 45, b: 45)
    let coronaLightGray = UIColor(r: 227, g: 228, b: 235)
    let separatorGray = UIColor(r: 77, g: 75, b: 75)
    let darkRed = UIColor(r: 82, g: 14, b: 8)
    let salmon = UIColor(r: 252, g: 171, b: 111)
    let lightRed = UIColor(red: 1, green: 0.796, blue: 0.796, alpha: 1)
}
