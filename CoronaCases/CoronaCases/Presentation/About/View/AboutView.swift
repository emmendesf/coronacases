//
//  AboutView.swift
//  CovidCases
//
//  Created by Caio Roberto on 11/05/20.
//  Copyright (c) 2020 A7&M. All rights reserved.
//

import UIKit

class AboutView: UIView {

    private let viewModel: AboutViewModel

    init(viewModel: AboutViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        self.viewModel.viewDelegate = self
        buildView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AboutView: AboutViewModelViewDelegate {

}

extension AboutView: ViewCodeProtocol {

    func setupHierarchy() {

    }

    func setupConstraints() {

    }
}
