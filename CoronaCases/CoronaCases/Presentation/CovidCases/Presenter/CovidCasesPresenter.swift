//
//  CovidCasesPresenter.swift
//  CovidCases
//
//  Created by Caio Roberto on 20/03/20.
//  Copyright (c) 2020 A7&M. All rights reserved.
//

import UIKit

class CovidCasesPresenter {
    weak var coordinatorDelegate: CovidCasesCoordinatorContract?
    weak var viewDelegate: CovidCasesViewContract?

    init(coordinatorDelegate: CovidCasesCoordinatorContract) {
        self.coordinatorDelegate = coordinatorDelegate
    }
}

extension CovidCasesPresenter: CovidCasesPresenterContract {
    
}
