//
//  NetworkError.swift
//  CovidCases
//
//  Created by Emerson Mendes Filho on 14/03/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

import Foundation

class NetworkError: NetworkErrorContract {
    var responseStatus: ResponseStatus
    var error: Error?
    var data: Data?

    required init(responseStatus: ResponseStatus, error: Error? = nil, data: Data? = nil) {
        self.responseStatus = responseStatus
        self.error = error
        self.data = data
    }
}
