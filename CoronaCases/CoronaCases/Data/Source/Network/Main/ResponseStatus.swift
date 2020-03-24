//
//  ResponseStatus.swift
//  CovidCases
//
//  Created by Emerson Mendes Filho on 14/03/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

import Foundation

enum ResponseStatus {
    case success
    case emptyData
    case notFound
    case unprocessable
    case unauthorized
    case forbidden
    case conflict
    case parseError
    case internalServerError
    case unknown

    init(statusCode: Int?) {
        switch statusCode ?? 0 {
        case 200..<300:
            self = .success
        case 404:
            self = .notFound
        case 401:
            self = .unauthorized
        case 403:
            self = .forbidden
        case 422:
            self = .unprocessable
        case 409:
            self = .conflict
        case 500:
            self = .internalServerError
        case 999:
            self = .parseError
        default:
            self = .unknown
        }
    }
}
