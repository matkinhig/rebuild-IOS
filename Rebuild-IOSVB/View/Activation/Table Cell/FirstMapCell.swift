//
//  FirstMapCell.swift
//  Rebuild-IOSVB
//
//  Created by Mắt Kính IG on 11/29/19.
//  Copyright © 2019 Mắt Kính IG. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class FirstMapCell: UITableViewCell {

    @IBOutlet var mapView: MKMapView!
    let locationManager = CLLocationManager()
    let regionMeter : Double = 10000
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
         checkLocationService()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func  setupLocationManager() -> Void {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func checkLocationService() -> Void {
        if CLLocationManager.locationServicesEnabled(){
            setupLocationManager()
            //setup location manager
            checkLocationAuthorizetion()
        }
        else {
            //hien canh bao tai day
        }
    }
    
    func checkLocationAuthorizetion() -> Void {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            mapView.showsUserLocation = true
            centerViewOnUserLocation()
            locationManager.startUpdatingLocation()
            //do map stuff
            break
        case .denied:
            // hien thi thong bao instructing how to open permission
            break
        case .restricted:
            //hien thi thong bao cho ho biet dieu gi dang xay ra
            break
        case .authorizedAlways:
            mapView.showsUserLocation = true
             break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            break
        @unknown default:
            fatalError()
        }
    }
    
    func centerViewOnUserLocation(){
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center : location, latitudinalMeters:  regionMeter, longitudinalMeters: regionMeter)
            mapView.setRegion(region, animated: true)
        }
    }

}

extension FirstMapCell : CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            return
        }
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion.init(center : center, latitudinalMeters: regionMeter, longitudinalMeters: regionMeter)
        mapView.setRegion(region, animated: true)
        
        //place holder
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorizetion()
        //place holder
    }
}
