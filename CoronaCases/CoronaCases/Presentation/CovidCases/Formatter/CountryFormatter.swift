//
//  CountryFormatter.swift
//  CovidCases
//
//  Created by Emerson Mendes Filho on 16/05/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

import Foundation

protocol CountryFormatterProtocol {
    var isFeatured: Bool { get set }
    var sortValue: Int { get }
    var casesFormatted: String { get }
    var deathsFormatted: String { get }
    var countryName: String { get }
}

final class CountryFormatter: CountryFormatterProtocol {
    private let country: Country
    
    init(country: Country) {
        self.country = country
    }
    
    private var numberFormatter: NumberFormatter {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        return numberFormatter
    }
    
    lazy var isFeatured: Bool = {
        let isWorldValue = country.name.lowercased() == "all"
        
        return isWorldValue
    }()
    
    lazy var sortValue: Int = {
        country.cases?.total ?? 0
    }()
    
    lazy var casesFormatted: String = {
        let numberOfCases = (country.cases?.total ?? 0)
        return numberFormatter.string(from: NSNumber(value: numberOfCases)) ?? ""
    }()
    
    lazy var deathsFormatted: String = {
        let numberOfDeaths = (country.deaths?.total ?? 0)
        return numberFormatter.string(from: NSNumber(value: numberOfDeaths)) ?? ""
    }()
    
    lazy var countryName: String = {
        return country.name
    }()
}
