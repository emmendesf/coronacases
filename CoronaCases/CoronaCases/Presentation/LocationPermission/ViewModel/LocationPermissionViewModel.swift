//
//  LocationPermissionViewModel.swift
//  CovidCases
//
//  Created by Caio Roberto on 19/03/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

class LocationPermissionViewModel {
    let locationManager: LocationManagerProtocol = LocationManager()
    weak var coordinatorDelegate: LocationPermissionViewModelCoordinatorDelegate?
    
    init(coordinatorDelegate: LocationPermissionViewModelCoordinatorDelegate) {
        self.coordinatorDelegate = coordinatorDelegate
    }
    
    func askForLocationAccessPermission() {
        locationManager.requestAuthorization { [weak self] status in
            switch status {
            case .success:
                self?.handleLocationPermissionSuccess()
            case .failure:
                self?.openNextScreenWithoutLocation()
            }
        }
    }
    
    private func handleLocationPermissionSuccess() {
        locationManager.reverseGeocodeLocation { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(location):
                self.handleReverseGeocodeLocationSuccess(location: location)
            case .failure:
                self.handleReverseGeocodeLocationError()
            }
        }
    }
    
    func openNextScreenWithoutLocation() {
        // TODO: Should open next screen
        coordinatorDelegate?.showMainScreen(location: nil)
    }
    
    private func handleReverseGeocodeLocationError() {
        // TODO: Should show an alert and then also open next screen without a location
        openNextScreenWithoutLocation()
    }
    
    private func handleReverseGeocodeLocationSuccess(location: Placemark) {
        // TODO: Should open next screen using user location as a parameter
        coordinatorDelegate?.showMainScreen(location: location)
    }
}
