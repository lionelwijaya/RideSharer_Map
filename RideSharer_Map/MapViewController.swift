//
//  MapViewController.swift
//  RideSharer_Map
//
//  Created by Lionel Richie Wijaya  on 24/03/22.
//

import UIKit
import MapKit

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    let locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLocationServices()
    }
    
    @IBOutlet weak var mapView: MKMapView!
    
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            checkLocationAuthorization()
        } else {
            let alert = UIAlertController(title: "Denied", message: "You need to enable the location service" , preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default, handler: { action in })
            alert.addAction(ok)
            self.present(alert, animated: true)
        }
    }
    
    func checkLocationAuthorization() {
      switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
          mapView.showsUserLocation = true
        case .denied:
          break
        case .notDetermined:
          locationManager.requestWhenInUseAuthorization()
          mapView.showsUserLocation = true
        case .restricted:
          break
        case .authorizedAlways:
          break
      @unknown default:
          break
      }
    }
}
