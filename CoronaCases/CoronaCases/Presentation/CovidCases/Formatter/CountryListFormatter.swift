//
//  CountryListFormatter.swift
//  CovidCases
//
//  Created by Emerson Mendes Filho on 16/05/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

import Foundation

struct CountryListFormatter {
    private let countries: [CountryFormatter]
    
    init(countries: [CountryFormatter]) {
        self.countries = countries
    }
    
    var featuredCountries: [CountryFormatter] {
        return countries.filter { $0.isFeatured }.sorted { $0.sortValue > $1.sortValue }
    }
    
    var standardCountries: [CountryFormatter] {
        return countries.filter { !$0.isFeatured }.sorted { $0.sortValue > $1.sortValue }
    }
    
    func numberOfRows(for section: CovidCasesListable.Section) -> Int {
        switch section {
        case .featured:
            return featuredCountries.count
        case .standard:
            return standardCountries.count
        }
    }
    
    func country(for row: Int, in section: CovidCasesListable.Section) -> CountryFormatter {
        switch section {
        case .featured:
            return featuredCountries[row]
        case .standard:
            return standardCountries[row]
        }
    }
}

