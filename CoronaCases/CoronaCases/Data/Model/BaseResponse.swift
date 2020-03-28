//
//  BaseResponse.swift
//  CovidCases
//
//  Created by Emerson Mendes Filho on 27/03/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

import Foundation

struct BaseResponse<T: Decodable>: Decodable {
    let get: String
    let parameters: [String: String]
    let errors: [String: String]
    let results: Int
    let response: T
    
    enum CodingKeys: CodingKey {
        case get
        case parameters
        case errors
        case results
        case response
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        get = try container.decode(String.self, forKey: .get)
        parameters = (try? container.decode([String: String].self, forKey: .parameters)) ?? [ : ]
        errors = (try? container.decode([String: String].self, forKey: .errors)) ?? [ : ]
        results = try container.decode(Int.self, forKey: .results)
        response = try container.decode(T.self, forKey: .response)
    }
}
