//
//  CoronaNetworkRequest.swift
//  CovidCases
//
//  Created by Emerson Mendes Filho on 14/03/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

import Foundation
import Alamofire

enum CoronaNetworkRequest: NetworkRequest {
    case world

    var path: String {
        let path: String

        switch self {
        case .world:
            path = "statistics"
        }

        return path
    }

    var method: HTTPMethod {
        return .get
    }

    var encoding: ParameterEncoding {
        return JSONEncoding.default
    }
    
    var parameters: [String : Any]? {
        return nil
    }
}
