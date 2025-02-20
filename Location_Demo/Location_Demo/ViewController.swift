//
//  ViewController.swift
//  Location_Demo
//
//  Created by Ryan Lin on 2/19/25.
//

//Add Background Modes
 //NSLocationWhenInUseUsageDescription
 //NSLocationAlwaysAndWhenInUseUsageDescription

 
import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    private var locationManager: CLLocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getUserLocation()
    }
    
    func getUserLocation() {
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        
        // Request permissions first
        locationManager?.requestAlwaysAuthorization()
        
        // Ensure Background Mode is enabled before allowing background updates
        if let infoDict = Bundle.main.infoDictionary,
           let backgroundModes = infoDict["UIBackgroundModes"] as? [String],
           backgroundModes.contains("location") {
            locationManager?.allowsBackgroundLocationUpdates = true
        }
        
        locationManager?.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            print("Lat: \(location.coordinate.latitude) \nLng: \(location.coordinate.longitude)")
        }
    }
}

//Lat: 37.33764603
//Lng: -122.02640815
// minute or so on power off
