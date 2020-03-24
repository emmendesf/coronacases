//
//  CLGeocoderProtocol.swift
//  CovidCases
//
//  Created by Caio Roberto on 19/03/20.
//  Copyright © 2020 A7&M. All rights reserved.
//


import CoreLocation

protocol CLGeocoderProtocol {
    func reverseGeocodeLocation(_ location: CLLocation,
                                completionHandler: @escaping CLGeocodeCompletionHandler)
}

extension CLGeocoder: CLGeocoderProtocol { }
