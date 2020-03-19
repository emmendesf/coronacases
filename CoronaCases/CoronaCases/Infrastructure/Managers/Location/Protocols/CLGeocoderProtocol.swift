//
//  CLGeocoderProtocol.swift
//  CoronaCases
//
//  Created by Caio Roberto on 19/03/20.
//  Copyright © 2020 Emerson Mendes Filho. All rights reserved.
//


import CoreLocation

protocol CLGeocoderProtocol {
    func reverseGeocodeLocation(_ location: CLLocation,
                                completionHandler: @escaping CLGeocodeCompletionHandler)
}

extension CLGeocoder: CLGeocoderProtocol { }
