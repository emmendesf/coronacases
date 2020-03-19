//
//  CustomColors.swift
//  CoronaCases
//
//  Created by Caio Roberto on 17/03/20.
//  Copyright © 2020 Emerson Mendes Filho. All rights reserved.
//

import UIKit
class CustomColors: UIColor {
    static let shared = CoronaColors()
}

struct CoronaColors {
    let coronaDarkGray = UIColor(r: 73, g: 73, b: 73)
    let coronaLightGray = UIColor(r: 227, g: 228, b: 235)
    let darkRed = UIColor(r: 82, g: 14, b: 8)
    let salmon = UIColor(r: 252, g: 171, b: 111)
}
