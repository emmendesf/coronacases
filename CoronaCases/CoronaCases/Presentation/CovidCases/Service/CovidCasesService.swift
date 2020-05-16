//
//  CovidCasesService.swift
//  CovidCases
//
//  Created by Emerson Mendes Filho on 14/03/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

class CovidCasesService: CovidCasesServiceContract {
    var network: NetworkCore

    init(core: NetworkCore = NetworkCore()) {
        self.network = core
    }

    func getStatistics(completion: @escaping (Result<[Country], NetworkError>) -> Void) {
        let request = CoronaNetworkRequest.world
        network.request(request, completion: completion)
    }
}
