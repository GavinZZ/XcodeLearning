//
//  ViewController.swift
//  Location Aware
//
//  Created by wm1 on 2017-11-20.
//  Copyright © 2017 Gavin. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var map: MKMapView!
    
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var alt: UILabel!
    @IBOutlet weak var speed: UILabel!
    @IBOutlet weak var course: UILabel!
    @IBOutlet weak var long: UILabel!
    @IBOutlet weak var lat: UILabel!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
       
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations[0]
        
        let latitude = location.coordinate.latitude
        let longitude = location.coordinate.longitude
        let latDelta: CLLocationDegrees = 0.05
        let lonDelta: CLLocationDegrees = 0.05
        let span = MKCoordinateSpanMake(latDelta, lonDelta)
        let location2D = CLLocationCoordinate2DMake(latitude, longitude)
        let region = MKCoordinateRegionMake(location2D, span)
        self.map.setRegion(region, animated: true)
        let annotation = MKPointAnnotation()
        annotation.title = "My Position"
        annotation.coordinate = location2D
        self.map.addAnnotation(annotation)
        
        if location.coordinate.latitude != nil {
            
            self.lat.text = "Latitude:  " + String(location.coordinate.latitude)
            
        }
        
        if location.coordinate.longitude != nil {
            
            self.long.text = "Longitude:  " + String(location.coordinate.longitude)
            
        }
        
        if location.course != nil {
            
            self.course.text = "Course:  " + String(location.course)
            
        }
        
        if location.speed != nil {
            
            self.speed.text = "Speed:  " + String(location.speed)
            
        }
        
        if location.altitude != nil {
            
            self.alt.text = "Altitude:  " + String(location.altitude)
            
        }
        
        CLGeocoder().reverseGeocodeLocation(location) { (placemarks, error) in
            
            if error != nil {
                print(error)
            } else {
                if let placemark = placemarks?[0] {
                    
                    var address = ""
                    
                    if placemark.subThoroughfare != nil {
                        address += placemark.subThoroughfare!
                    }
                    
                    if placemark.thoroughfare != nil {
                        address += placemark.thoroughfare! + "\n"
                    }
                    if placemark.subLocality != nil {
                        address += placemark.subLocality! + "\n"
                    }
                    if placemark.subAdministrativeArea != nil {
                        address += placemark.subAdministrativeArea! + "\n"
                    }
                    if placemark.postalCode != nil {
                        address += placemark.postalCode! + ", "
                    }
                    if placemark.country != nil {
                        address += placemark.country! + "\n"
                    }
                    self.address.text = address
                }
            }
            
        }
        
    }
    
    
}

