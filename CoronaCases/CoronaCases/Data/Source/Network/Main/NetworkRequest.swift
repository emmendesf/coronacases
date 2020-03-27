//
//  NetworkRequest.swift
//  CovidCases
//
//  Created by Emerson Mendes Filho on 14/03/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

import Foundation
import Alamofire

enum NetworkRequestError: Error {
    case invalidURL
}

protocol NetworkRequest {
    var baseURL: URL? { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var encoding: ParameterEncoding { get }
    var parameters: [String: Any]? { get }
    var headers: HTTPHeaders? { get }
    
    func parseJSON<T: Decodable>(from data: Data) throws -> T
    func serialize<T: Encodable>(_ object: T) -> [String: Any]
}

extension NetworkRequest {
    var baseURL: URL? {
        return URL(string: "https://covid-193.p.rapidapi.com/")
    }
    
    var encoding: ParameterEncoding {
        return URLEncoding.httpBody
    }
    
    var headers: HTTPHeaders? {
        return ["x-rapidapi-host": "covid-193.p.rapidapi.com",
                "x-rapidapi-key": "0dcba3befbmsh13fc5c5fc77c722p157d8fjsn2a6847a6699b"]
    }
    
    func toRequest() throws -> URLRequestConvertible {
        guard let url = baseURL?.appendingPathComponent(path) else {
            throw NetworkRequestError.invalidURL
        }
        
        var urlRequest = try URLRequest(url: url, method: method, headers: headers)
        
        urlRequest.timeoutInterval = 60
        return try encoding.encode(urlRequest, with: parameters)
    }
    
    func parseJSON<T: Decodable>(from data: Data) throws -> T {
        let value = try JSONDecoder().decode(T.self, from: data)
        return value
    }
    
    func serialize<T: Encodable>(_ object: T) -> [String: Any] {
        do {
            let data = try JSONEncoder().encode(object)
            let dict = try JSONSerialization.jsonObject(
                with: data,
                options: .allowFragments
                ) as? [String: Any]
            return dict ?? [:]
        } catch {
            return [:]
        }
    }
}
