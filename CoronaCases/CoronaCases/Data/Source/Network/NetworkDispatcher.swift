//
//  NetworkDispatcher.swift
//  CoronaCases
//
//  Created by Emerson Mendes Filho on 14/03/20.
//  Copyright © 2020 Emerson Mendes Filho. All rights reserved.
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

    private func buildServerTrustPolicies() -> [String: ServerTrustPolicy] {
        let environment = Environment()

        let serverTrustPolicies: [String: ServerTrustPolicy] = [
            environment.dataPowerURL.rawURL(): environment.dataPowerServerTrustPolicy,
            environment.baseURL.rawURL(): environment.webApiServerTrustPolicy
        ]

        return serverTrustPolicies
    }

    private lazy var sessionManager: SessionManager = {
        let serverTrustPolicies = buildServerTrustPolicies()

        return SessionManager(
            serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies)
        )
    }()

    func performRequest(_ request: NetworkRequest,
                        completion: @escaping (Response) -> Void) {
        DispatchQueue.main.async {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }
        sessionManager.retrier = request.retrier?.init(dispatcher: self,
                                                       oauthRequest: request.oauthRequest)
        do {
            let urlRequest = try request.toRequest()
            dataRequest = sessionManager
                .request(urlRequest)
                .validate(statusCode: 200..<300)
                .response { response in
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false

                    let requestResponse = self.responseFromResponseInfo(
                        httpResponse: response.response,
                        data: response.data,
                        error: response.error
                    )

                    completion(requestResponse)
            }
        } catch {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            let requestResponse = responseFromResponseInfo(httpResponse: nil,
                                                           data: nil,
                                                           error: NetworkErrorType.requestError)

            completion(requestResponse)
        }
    }

    func cancelRequest() {
        dataRequest?.cancel()
    }

    private func responseFromResponseInfo(httpResponse: HTTPURLResponse?,
                                          data: Data?,
                                          error: Error?) -> Response {
        let responseInfo = ResponseInfo(httpResponse: httpResponse,
                                        data: data,
                                        error: error)
        return Response(responseInfo)
    }
}

