//
//  MainScreenViewModel.swift
//  CovidCases
//
//  Created by Caio Roberto on 20/03/20.
//  Copyright (c) 2020 A7&M. All rights reserved.
//

import UIKit

class MainScreenViewModel {
    weak var coordinatorDelegate: MainScreenViewModelCoordinatorDelegate?
    weak var viewDelegate: MainScreenViewModelViewDelegate?

    init(coordinatorDelegate: MainScreenViewModelCoordinatorDelegate) {
        self.coordinatorDelegate = coordinatorDelegate
    }
}
