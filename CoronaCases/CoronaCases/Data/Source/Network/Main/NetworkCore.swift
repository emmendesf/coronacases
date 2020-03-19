//
//  NetworkCore.swift
//  CoronaCases
//
//  Created by Emerson Mendes Filho on 14/03/20.
//  Copyright © 2020 Emerson Mendes Filho. All rights reserved.
//

class NetworkCore {

    private let networkDispatcher: NetworkDispatcherContract

    init(networkDispatcher: NetworkDispatcherContract = NetworkDispatcher.shared) {
        self.networkDispatcher = networkDispatcher
    }

    func request<T: Decodable, U>(_ request: NetworkRequest,
                                  completion: @escaping (Result<T, U>) -> Void) {
            self.networkDispatcher.performRequest(request) { response in
                switch response {
                case let .success(data):
                    do {
                        let value: T = try request.parseJSON(from: data)
                        completion(.success(value))
                    } catch {
                        let parseError = U(responseStatus: .parseError, error: nil, data: nil)
                        completion(.failure(parseError))
                    }

                case let .error(responseStatus, error, data):
                    let error = U(responseStatus: responseStatus, error: error, data: data)
                    completion(.failure(error))
                }
            }
        }

    func cancelRequest() {
        networkDispatcher.cancelRequest()
    }
}
