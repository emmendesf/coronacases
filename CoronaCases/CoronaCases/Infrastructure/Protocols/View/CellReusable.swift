//
//  CellReusable.swift
//  CovidCases
//
//  Created by Emerson Mendes Filho on 29/03/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

import UIKit

protocol CellReusable {
    static var identifier: String { get }
}

extension CellReusable where Self: UIView {
    static var identifier: String {
        return String(describing: self)
    }
}

