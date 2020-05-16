//
//  CovidCasesViewState.swift
//  CovidCases
//
//  Created by Emerson Mendes Filho on 29/03/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

enum CovidCasesViewState {
    case loading
    case loaded(with: CountryListFormatter)
    case searched(with: [CountryFormatter])
    case error
}
