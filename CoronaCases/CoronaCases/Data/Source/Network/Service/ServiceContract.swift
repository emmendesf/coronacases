//
//  ServiceContract.swift
//  CoronaCases
//
//  Created by Emerson Mendes Filho on 14/03/20.
//  Copyright © 2020 Emerson Mendes Filho. All rights reserved.
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
