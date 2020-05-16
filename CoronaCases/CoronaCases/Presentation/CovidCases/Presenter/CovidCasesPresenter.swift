//
//  CovidCasesPresenter.swift
//  CovidCases
//
//  Created by Caio Roberto on 20/03/20.
//  Copyright (c) 2020 A7&M. All rights reserved.
//

import UIKit

final class CovidCasesPresenter {
    weak var coordinator: CovidCasesCoordinatorContract?
    weak var view: CovidCasesViewContract?

    private let service: CovidCasesServiceContract
    
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
        let countriesFormatted = countries.map { CountryFormatter(country: $0) }
        let countryListFormatter = CountryListFormatter(countries: countriesFormatted)
        view?.updateView(state: .loaded(with: countryListFormatter))
    }
    
    private func handleGetStatisticsFailure() {
        view?.updateView(state: .error)
    }
}

extension CovidCasesPresenter: CovidCasesPresenterContract {
    
}
