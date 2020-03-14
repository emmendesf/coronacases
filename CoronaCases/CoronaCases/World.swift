//
//  World.swift
//  CoronaCases
//
//  Created by Carlos Henrique Martins Cayres on 14/03/20.
//  Copyright © 2020 Emerson Mendes Filho. All rights reserved.
//

import Foundation

class World: Codable {
    
    let date: String?
    let time: String?
    let values: [Country]?
    let total: Total?
}

