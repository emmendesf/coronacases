//
//  CovidCasesPresenter.swift
//  CovidCases
//
//  Created by Caio Roberto on 20/03/20.
//  Copyright (c) 2020 A7&M. All rights reserved.
//

import UIKit

final class CovidCasesPresenter {
    weak var coordinatorDelegate: CovidCasesCoordinatorContract?
    weak var viewDelegate: CovidCasesViewContract?

    private let service: CovidCasesServiceContract
    
    init(coordinatorDelegate: CovidCasesCoordinatorContract,
         service: CovidCasesServiceContract = CovidCasesService()) {
        self.coordinatorDelegate = coordinatorDelegate
        self.service = service
    }
    
    func requestStatistics() {
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
        
    }
    
    private func handleGetStatisticsFailure() {
        
    }
}

extension CovidCasesPresenter: CovidCasesPresenterContract {
    
}
