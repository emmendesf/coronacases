//
//  ServiceContract.swift
//  CovidCases
//
//  Created by Emerson Mendes Filho on 14/03/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

protocol ServiceContract {
    var network: NetworkCore { get set }
    func cancelRequest()
}

extension ServiceContract {
    func cancelRequest() {
        network.cancelRequest()
    }
}
