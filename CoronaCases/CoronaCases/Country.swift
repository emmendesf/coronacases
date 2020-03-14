//
//  Country.swift
//  CoronaCases
//
//  Created by Carlos Henrique Martins Cayres on 14/03/20.
//  Copyright © 2020 Emerson Mendes Filho. All rights reserved.
//

import Foundation

class Country: Codable {
    
    let uid: String?
    let cases: Int?
    let casesNew: Int?
    let deaths: Int?
    let deathNew: Int?
    let comments: String?
    let breadcast: Bool?
}
