//
//  ViewController.swift
//  location Demo
//
//  Created by Sandeep Jangra on 2020-01-09.
//  Copyright © 2020 Sandeep. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
class ViewController: UIViewController,CLLocationManagerDelegate
{
    // create a variable of  CLLocationManager
    var locationManager = CLLocationManager()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
       
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        // grabbing the user location
        let userLocation: CLLocation = locations[0]
        let lat = userLocation.coordinate.latitude
        let long = userLocation.coordinate.longitude
        
        let latDelta: CLLocationDegrees = 0.05
        let longDelta: CLLocationDegrees = 0.05
        
        let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
        lat location = CLLocationCoordinate2D(latitude: lat, longitude: long)
       // print(userLocation)
        
        //finding the address from the user location
        CLGeocoder().reverseGeocodeLocation(userLocation) {(placemarks, error) in
            if let error = error {
                print(error)
            } else {
                if let placemark = placemarks?[0]{
                  var subThoroufare = ""
                       if placemark.subThoroughfare != nil
                        {
                          subThoroufare=placemark.subThoroughfare!
                      }
                    var thoroufare = ""
                    if placemark.thoroughfare != nil{
                      thoroufare=placemark.thoroughfare!
                    }
                     
                    var subLocality = ""
                    if placemark.subLocality != nil
                    {
                      subLocality=placemark.subLocality!
                    }
                     
                    var subAdministrativeArea = ""
                    if placemark.subAdministrativeArea != nil
                    {
                      subAdministrativeArea=placemark.subAdministrativeArea!
                    }
                     
                    var postalCode = ""
                    if placemark.postalCode != nil
                    {
                      postalCode=placemark.postalCode!
                    }
                     
                    var country = ""
                    if placemark.country != nil
                    {
                      country=placemark.country!
                    }
                     
                    print(subThoroufare + "\n" + thoroufare + "\n" + subLocality + "\n" + subAdministrativeArea + "\n" + postalCode + "\n" + country)
                    
                }
            }
            
        }
        
    }
    

}

