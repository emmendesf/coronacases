//
//  CovidCasesPresenter.swift
//  CovidCases
//
//  Created by Caio Roberto on 20/03/20.
//  Copyright (c) 2020 A7&M. All rights reserved.
//

import UIKit

final class CovidCasesPresenter {
    private weak var coordinator: CovidCasesCoordinatorContract?
    weak var view: CovidCasesViewContract?

    private let service: CovidCasesServiceContract
    
    private var countriesFormatted: [CountryFormatter] = []
    
    init(coordinatorDelegate: CovidCasesCoordinatorContract,
         service: CovidCasesServiceContract = CovidCasesService()) {
        self.coordinator = coordinatorDelegate
        self.service = service
    }
    
    func requestStatistics() {
        view?.updateView(state: .loading)
        service.getStatistics { [weak self] (result) in
            switch result {
            case let .success(countries):
                self?.handleGetStatisticsSuccess(with: countries)
            case .failure:
                self?.handleGetStatisticsFailure()
            }
        }
    }
    
    private func handleGetStatisticsSuccess(with countries: [Country]) {
        countriesFormatted = countries.map { CountryFormatter(country: $0) }
        let countryListFormatter = CountryListFormatter(countries: countriesFormatted)
        view?.updateView(state: .loaded(with: countryListFormatter))
    }
    
    private func handleGetStatisticsFailure() {
        view?.updateView(state: .error)
    }
}

extension CovidCasesPresenter: CovidCasesPresenterContract {
    func search(text: String?) {
        guard let text = text, !text.isEmpty else {
            let countryListFormatter = CountryListFormatter(countries: countriesFormatted)
            view?.updateView(state: .loaded(with: countryListFormatter))
            return
        }
        
        let filteredCountries = countriesFormatted.filter { $0.countryName.contains(text) }
        view?.updateView(state: .searched(with: filteredCountries))
    }
}
