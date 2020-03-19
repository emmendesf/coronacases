//
//  ReverseGeocodeResult.swift
//  CoronaCases
//
//  Created by Caio Roberto on 19/03/20.
//  Copyright © 2020 Emerson Mendes Filho. All rights reserved.
//

import CoreLocation

enum ReverseGeocodeResult {
    case success(Placemark)
    case failure
}

protocol Placemark {
    var latitude: String? { get }
    var longitude: String? { get }
    var street: String? { get }
}

extension CLPlacemark: Placemark {
    var latitude: String? { return String(location?.coordinate.latitude ?? CLLocationDegrees()) }
    var longitude: String? { return String(location?.coordinate.longitude ?? CLLocationDegrees()) }
    var street: String? { return thoroughfare }
}
