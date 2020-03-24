//
//  CLLocationManagerProtocol.swift
//  CovidCases
//
//  Created by Caio Roberto on 19/03/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

import CoreLocation

protocol CLLocationManagerProtocol {
    var delegate: CLLocationManagerDelegate? { get set }
    var desiredAccuracy: CLLocationAccuracy { get set }
    func requestWhenInUseAuthorization()
    func startUpdatingLocation()
    func stopUpdatingLocation()
    static func authorizationStatus() -> CLAuthorizationStatus
}

extension CLLocationManager: CLLocationManagerProtocol { }
