//
//  Response.swift
//  CovidCases
//
//  Created by Emerson Mendes Filho on 14/03/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

import Foundation

enum Response {
    struct ResponseInfo {
        var httpResponse: HTTPURLResponse?
        var data: Data?
        var error: Error?
    }
    
    case success(Data)
    case error(ResponseStatus, Error?, Data?)

    init(_ response: ResponseInfo) {
        let responseStatus = ResponseStatus(statusCode: response.httpResponse?.statusCode)
        guard responseStatus == .success, response.error == nil else {
            self = .error(responseStatus, response.error, response.data)
            return
        }

        guard let data = response.data else {
            self = .error(responseStatus, NetworkErrorType.noData, response.data)
            return
        }

        self = .success(data)
    }
}
