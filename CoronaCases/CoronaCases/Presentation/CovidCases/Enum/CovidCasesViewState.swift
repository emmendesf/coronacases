//
//  CovidCasesViewState.swift
//  CovidCases
//
//  Created by Emerson Mendes Filho on 29/03/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

enum CovidCasesViewState {
    case loading
    case loaded(with: CountryListFormatterProtocol)
    case searched(with: [CountryFormatterProtocol])
    case error
}
