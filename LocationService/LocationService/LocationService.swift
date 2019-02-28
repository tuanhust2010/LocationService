//
//  LocationService.swift
//  LocationService
//
//  Created by nguyen.manh.tuanb on 28/02/2019.
//  Copyright © 2019 nguyen.manh.tuanb. All rights reserved.
//

import UIKit
import MapKit
import RxSwift

open class LocationService: NSObject, CLLocationManagerDelegate {
    
    public let didReceiveLocation = PublishSubject<CLLocation>()
    private var locationManager = CLLocationManager()
    
    public override init() {
        super.init()
        setup()
    }
    
    private func setup() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    open func locationServiceEnable() -> Bool {
        if CLLocationManager.locationServicesEnabled() {
            switch CLLocationManager.authorizationStatus() {
            case .notDetermined, .restricted, .denied:
                return false
            case .authorizedAlways, .authorizedWhenInUse:
                return true
            }
        }
        return true
    }
    
    open func updateLocation() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    private func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        locationManager.stopUpdatingLocation()
        didReceiveLocation.onNext(location)
    }
    
    private func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("map \(error.localizedDescription)")
        didReceiveLocation.onError(error)
    }
}
