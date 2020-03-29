//
//  MainScreenView.swift
//  CovidCases
//
//  Created by Caio Roberto on 20/03/20.
//  Copyright (c) 2020 A7&M. All rights reserved.
//

import UIKit

class MainScreenView: UIView {

    private let viewModel: MainScreenViewModel

    init(viewModel: MainScreenViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        self.viewModel.viewDelegate = self
        buildView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainScreenView: MainScreenViewModelViewDelegate {

}

extension MainScreenView: ViewCodeProtocol {

    func setupHierarchy() {

    }

    func setupConstraints() {

    }
}
