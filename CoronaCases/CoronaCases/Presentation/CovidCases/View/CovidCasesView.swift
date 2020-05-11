//
//  CovidCasesView.swift
//  CovidCases
//
//  Created by Caio Roberto on 20/03/20.
//  Copyright (c) 2020 A7&M. All rights reserved.
//

import UIKit

class CovidCasesView: UIView {

    private var presenter: CovidCasesPresenterContract

    init(presenter: CovidCasesPresenterContract) {
        self.presenter = presenter
        super.init(frame: .zero)
        self.presenter.viewDelegate = self
        buildView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CovidCasesView: CovidCasesViewContract {

}

extension CovidCasesView: ViewCodeProtocol {

    func setupHierarchy() {

    }

    func setupConstraints() {

    }
}
