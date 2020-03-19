//
//  LocationManagerProtocol.swift
//  CoronaCases
//
//  Created by Caio Roberto on 19/03/20.
//  Copyright © 2020 Emerson Mendes Filho. All rights reserved.
//

import CoreLocation

protocol LocationManagerProtocol {
    var authorizationStatus: CLAuthorizationStatus { get }
    func requestAuthorization(completion: @escaping (AuthorizationResult) -> Void)
    func requestLocation(completion: @escaping (LocationResult) -> Void)
    func reverseGeocodeLocation(completion: @escaping (ReverseGeocodeResult) -> Void)
}

extension LocationManagerProtocol {
    var authorized: Bool {
        return authorizationStatus == .authorizedWhenInUse
    }
}
