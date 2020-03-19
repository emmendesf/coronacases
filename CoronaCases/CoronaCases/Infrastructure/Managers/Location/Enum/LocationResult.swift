//
//  LocationResult.swift
//  CoronaCases
//
//  Created by Caio Roberto on 19/03/20.
//  Copyright © 2020 Emerson Mendes Filho. All rights reserved.
//

import CoreLocation

enum LocationResult {
    case success(CLLocationCoordinate2D)
    case failure(Error)
}
