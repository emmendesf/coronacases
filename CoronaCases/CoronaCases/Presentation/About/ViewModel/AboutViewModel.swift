//
//  AboutViewModel.swift
//  CovidCases
//
//  Created by Caio Roberto on 11/05/20.
//  Copyright (c) 2020 A7&M. All rights reserved.
//

import UIKit

class AboutViewModel {
    weak var coordinatorDelegate: AboutViewModelCoordinatorDelegate?
    weak var viewDelegate: AboutViewModelViewDelegate?

    init(coordinatorDelegate: AboutViewModelCoordinatorDelegate) {
        self.coordinatorDelegate = coordinatorDelegate
    }
}
