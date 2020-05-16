//
//  Reusable.swift
//  CovidCases
//
//  Created by Emerson Mendes Filho on 29/03/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

import UIKit

protocol Reusable {
    static var identifier: String { get }
}

extension Reusable where Self: UIView {
    static var identifier: String {
        return String(describing: self)
    }
}

