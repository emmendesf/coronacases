//
//  UIImageView+Extensions.swift
//  CovidCases
//
//  Created by Caio Roberto on 20/03/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

import UIKit

extension UIImageView {
  func setImageColor(color: UIColor) {
    let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
    self.image = templateImage
    self.tintColor = color
  }
}
