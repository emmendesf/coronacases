//
//  CountryFormatter.swift
//  CovidCases
//
//  Created by Emerson Mendes Filho on 16/05/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

import Foundation

struct CountryFormatter {
    private let country: Country
    
    init(country: Country) {
        self.country = country
    }
    
    private var numberFormatter: NumberFormatter {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        return numberFormatter
    }
    
    var isFeatured: Bool = false
    
    var sortValue: Int {
        return country.cases?.total ?? 0
    }
    
    var casesFormatted: String {
        let numberOfCases = (country.cases?.total ?? 0)
        return numberFormatter.string(from: NSNumber(value: numberOfCases)) ?? ""
    }
    
    var deathsFormatted: String {
        let numberOfDeaths = (country.deaths?.total ?? 0)
        return numberFormatter.string(from: NSNumber(value: numberOfDeaths)) ?? ""
    }
    
    var countryInitials: String {
        return String(country.name.prefix(2)).uppercased()
    }
    
    var countryName: String {
        return country.name
    }
}
