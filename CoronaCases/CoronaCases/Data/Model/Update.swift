//
//  Update.swift
//  CovidCases
//
//  Created by Carlos Henrique Martins Cayres on 14/03/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

import Foundation

class Update: Codable {
    
    let date: String?
    let time: String?
    let values: [Country]?
    let total: Total?
}

