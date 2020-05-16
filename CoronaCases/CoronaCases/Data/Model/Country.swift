//
//  Country.swift
//  CovidCases
//
//  Created by Carlos Henrique Martins Cayres on 14/03/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

import Foundation

struct Country: Decodable {
    let name: String
    let cases: Cases?
    let deaths: Deaths?
    let date: Date
    
    enum CodingKeys: String, CodingKey {
        case name = "country"
        case cases
        case deaths
        case date = "time"
    }
}
