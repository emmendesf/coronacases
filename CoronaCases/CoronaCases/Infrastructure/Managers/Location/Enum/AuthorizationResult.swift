//
//  AuthorizationResult.swift
//  CovidCases
//
//  Created by Caio Roberto on 19/03/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

import CoreLocation

enum AuthorizationResult {
    case success
    case failure(CLAuthorizationStatus)
}
