//
//  CountryListFormatter.swift
//  CovidCases
//
//  Created by Emerson Mendes Filho on 16/05/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

import Foundation

protocol CountryListFormatterProtocol {
    var featuredCountries: [CountryFormatterProtocol] { get }
    var standardCountries: [CountryFormatterProtocol] { get }
    func numberOfRows(for section: CovidCasesListable.Section) -> Int
    func country(for row: Int, in section: CovidCasesListable.Section) -> CountryFormatterProtocol
}

final class CountryListFormatter: CountryListFormatterProtocol {
    private let countries: [CountryFormatter]
    
    init(countries: [CountryFormatter]) {
        self.countries = countries
    }
    
    lazy var featuredCountries: [CountryFormatterProtocol] = {
       countries.filter { $0.isFeatured }.sorted { $0.sortValue > $1.sortValue }
    }()
    
    lazy var standardCountries: [CountryFormatterProtocol] = {
        countries.filter { !$0.isFeatured }.sorted { $0.sortValue > $1.sortValue }
    }()
    
    func numberOfRows(for section: CovidCasesListable.Section) -> Int {
        switch section {
        case .featured:
            return featuredCountries.count
        case .standard:
            return standardCountries.count
        }
    }
    
    func country(for row: Int, in section: CovidCasesListable.Section) -> CountryFormatterProtocol {
        switch section {
        case .featured:
            return featuredCountries[row]
        case .standard:
            return standardCountries[row]
        }
    }
}
