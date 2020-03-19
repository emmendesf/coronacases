//
//  NetworkErrorType.swift
//  CoronaCases
//
//  Created by Emerson Mendes Filho on 14/03/20.
//  Copyright © 2020 Emerson Mendes Filho. All rights reserved.
//

import Foundation

enum NetworkErrorType: Error {
    case failValidationToken
    case requestError
    case noData
    case parseError
}
