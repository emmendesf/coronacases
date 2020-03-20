//  OnboardView.swift
//  CoronaCases
//
//  Created by Caio Roberto on 20/03/20.
//  Copyright (c) 2020 Emerson Mendes Filho. All rights reserved.

import UIKit

class OnboardView: UIView {

    private let viewModel: OnboardViewModel

    init(viewModel: OnboardViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        self.viewModel.viewDelegate = self
        buildView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension OnboardView: OnboardViewModelViewDelegate {

}

extension OnboardView: ViewCodeProtocol {

    func setupHierarchy() {

    }

    func setupConstraints() {

    }
}
