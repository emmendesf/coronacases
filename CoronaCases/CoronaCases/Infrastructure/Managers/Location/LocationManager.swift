//
//  LocationManager.swift
//  CoronaCases
//
//  Created by Caio Roberto on 19/03/20.
//  Copyright © 2020 Emerson Mendes Filho. All rights reserved.
//

import CoreLocation

class LocationManager: NSObject, LocationManagerProtocol {
    private var locationManager: CLLocationManagerProtocol
    private var geocoder: CLGeocoderProtocol

    var authorizationStatus: CLAuthorizationStatus {
        return type(of: locationManager).authorizationStatus()
    }

    private var locationCompletion: ((LocationResult) -> Void)?
    private var authorizationCompletion: ((AuthorizationResult) -> Void)?

    init(locationManager: CLLocationManagerProtocol = CLLocationManager(),
         geocoder: CLGeocoderProtocol = CLGeocoder()) {
        self.locationManager = locationManager
        self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        self.geocoder = geocoder
        super.init()
        self.locationManager.delegate = self
    }

    func requestAuthorization(completion: @escaping (AuthorizationResult) -> Void) {
        authorizationCompletion = completion

        switch authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .authorizedWhenInUse:
            authorizationCompletion?(.success)
        default:
            authorizationCompletion?(.failure(authorizationStatus))
        }
    }

    func requestLocation(completion: @escaping (LocationResult) -> Void) {
        locationCompletion = completion
        locationManager.startUpdatingLocation()
    }

    func reverseGeocodeLocation(completion: @escaping (ReverseGeocodeResult) -> Void) {
        requestLocation { result in
            switch result {
            case .success(let coordinate):
                self.reverseGeocode(forCoordinate: coordinate, completion: completion)
            case .failure:
                completion(.failure)
            }
        }
    }

    private func reverseGeocode(forCoordinate coordinate: CLLocationCoordinate2D,
                                completion: @escaping (ReverseGeocodeResult) -> Void) {
        let location = CLLocation(
            latitude: coordinate.latitude,
            longitude: coordinate.longitude
        )
        self.geocoder.reverseGeocodeLocation(location) { placemarks, error in
            guard error == nil,
                let placemark = placemarks?.first else {
                    completion(.failure)
                    return
            }

            completion(.success(placemark))
        }
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        guard status == .authorizedWhenInUse else {
            authorizationCompletion?(.failure(status))
            return
        }
        authorizationCompletion?(.success)
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        locationManager.stopUpdatingLocation()
        locationCompletion?(.success(location.coordinate))
        locationCompletion = nil
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        locationCompletion?(.failure(error))
    }
}
