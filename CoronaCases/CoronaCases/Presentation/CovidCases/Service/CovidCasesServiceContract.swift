//
//  CovidCasesServiceContract.swift
//  CovidCases
//
//  Created by Emerson Mendes Filho on 29/03/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

protocol CovidCasesServiceContract: ServiceContract {
    func getStatistics(completion: @escaping (Result<[Country], NetworkError>) -> Void)
}
