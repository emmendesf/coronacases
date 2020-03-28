//
//  Cases.swift
//  CovidCases
//
//  Created by Emerson Mendes Filho on 27/03/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

import Foundation

public struct Cases: Decodable {
    let new: String?
    let active: Int
    let casesNew: Int?
    let critical: Int
    let recovered: Int
    let total: Int
}
