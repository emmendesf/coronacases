//
//  NetworkError.swift
//  CoronaCases
//
//  Created by Emerson Mendes Filho on 14/03/20.
//  Copyright © 2020 Emerson Mendes Filho. All rights reserved.
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
