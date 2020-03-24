//
//  ViewCodeProtocol.swift
//  CovidCases
//
//  Created by Caio Roberto on 14/03/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

import Foundation

protocol ViewCodeProtocol {
    func setupHierarchy()
    func setupConstraints()
    func additionalSetup()

    func buildView()
}

extension ViewCodeProtocol {
    func buildView() {
        setupHierarchy()
        setupConstraints()
        additionalSetup()
    }

    func additionalSetup() { }
}
