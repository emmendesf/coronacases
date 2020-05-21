//
//  UIColor+Extensions.swift
//  CovidCases
//
//  Created by Caio Roberto on 17/03/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat = 1) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: alpha)
    }
}
