//
//  NetworkErrorContract.swift
//  CovidCases
//
//  Created by Emerson Mendes Filho on 14/03/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

import Foundation

protocol NetworkErrorContract {
    var responseStatus: ResponseStatus { get set }
    var error: Error? { get set }
    var data: Data? { get set }

    init(responseStatus: ResponseStatus, error: Error?, data: Data?)
}

extension NetworkErrorContract {
    var isCancelledRequest: Bool {
        return (error as NSError?)?.code == NSURLErrorCancelled
    }
}
