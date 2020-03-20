//  OnboardViewModel.swift
//  CoronaCases
//
//  Created by Caio Roberto on 20/03/20.
//  Copyright (c) 2020 Emerson Mendes Filho. All rights reserved.

import UIKit

class OnboardViewModel {
    weak var coordinatorDelegate: OnboardViewModelCoordinatorDelegate?
    weak var viewDelegate: OnboardViewModelViewDelegate?

    init(coordinatorDelegate: OnboardViewModelCoordinatorDelegate) {
        self.coordinatorDelegate = coordinatorDelegate
    }
}
