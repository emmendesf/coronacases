//
//  CovidCasesService.swift
//  CovidCases
//
//  Created by Emerson Mendes Filho on 14/03/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

protocol CoronaCasesServiceContract: ServiceContract {
    func getWorldCases(completion: @escaping (Result<[Update], NetworkError>) -> Void)
}

class CoronaCasesService: CoronaCasesServiceContract {
    var network: NetworkCore

    init(core: NetworkCore = NetworkCore()) {
        self.network = core
    }

    func getWorldCases(completion: @escaping (Result<[Update], NetworkError>) -> Void) {
        let request = CoronaNetworkRequest.world
        network.request(request, completion: completion)
    }
}
