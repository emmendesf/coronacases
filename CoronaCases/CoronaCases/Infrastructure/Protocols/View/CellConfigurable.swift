//
//  CellConfigurable.swift
//  CovidCases
//
//  Created by Emerson Mendes Filho on 16/05/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

protocol CellConfigurable {
    associatedtype Model
    func configure(with model: Model)
}
