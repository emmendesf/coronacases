//
//  NetworkDispatcher.swift
//  CovidCases
//
//  Created by Emerson Mendes Filho on 14/03/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

import Alamofire

protocol NetworkDispatcherContract {
    func performRequest(_ request: NetworkRequest,
                        completion: @escaping (Response) -> Void)
    
    func cancelRequest()
}

class NetworkDispatcher: NetworkDispatcherContract {
    
    private var dataRequest: DataRequest?
    static let shared: NetworkDispatcherContract = NetworkDispatcher()
    
    private lazy var sessionManager: SessionManager = {
        var headers = Alamofire.SessionManager.defaultHTTPHeaders
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = headers

        return SessionManager(configuration: configuration)
    }()
    
    func performRequest(_ request: NetworkRequest,
                        completion: @escaping (Response) -> Void) {
        
        do {
            let urlRequest = try request.toRequest()
            dataRequest = sessionManager
                .request(urlRequest)
                .validate(statusCode: 200..<304)
                .response { response in
                    let responseInfo = Response.ResponseInfo(
                        httpResponse: response.response,
                        data: response.data,
                        error: response.error
                    )
                    let response = Response(responseInfo)
                    completion(response)
            }
        } catch {
            let responseInfo = Response.ResponseInfo(
                httpResponse: nil,
                data: nil,
                error: NetworkErrorType.requestError
            )
            let response = Response(responseInfo)
            
            completion(response)
        }
    }
    
    func cancelRequest() {
        dataRequest?.cancel()
    }
}
