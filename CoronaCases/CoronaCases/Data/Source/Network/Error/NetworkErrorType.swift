//
//  NetworkErrorType.swift
//  CovidCases
//
//  Created by Emerson Mendes Filho on 14/03/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

import Foundation

enum NetworkErrorType: Error {
    case failValidationToken
    case requestError
    case noData
    case parseError
}
