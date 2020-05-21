//
//  UISearchController+Extensions.swift
//  CovidCases
//
//  Created by Caio Roberto on 20/05/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

import UIKit

extension UISearchController {
    func configureSearchBarForMainScreen() {
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = CustomColors.shared.coronaLightGray.withAlphaComponent(0.2)
        UIImageView.appearance(whenContainedInInstancesOf: [UISearchBar.self]).tintColor = CustomColors.shared.coronaLightGray.withAlphaComponent(0.6)
    }
}
