//
//  ViewController.swift
//  Memorable Places
//
//  Created by wm1 on 2017-11-21.
//  Copyright © 2017 Gavin. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController,  MKMapViewDelegate, CLLocationManagerDelegate{
    
    @IBOutlet weak var map: MKMapView!

    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        if (activePos != -1) {
        
            let str1 = Double(places[activePos]["lat"]!)
            let str2 = Double(places[activePos]["lon"]!)
            
            let latitude: CLLocationDegrees = str1!
            let longitude: CLLocationDegrees = str2!
            let latDelta: CLLocationDegrees = 0.5
            let lonDelta: CLLocationDegrees = 0.05
            let span: MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
            let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
            let region = MKCoordinateRegionMake(location, span)
            map.setRegion(region, animated: true)
            let annotation = MKPointAnnotation()
            annotation.title = places[activePos]["name"]
            annotation.coordinate = location
            map.addAnnotation(annotation)
        }
        
        
        let uilpgr = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longpress(gestureRecognizer:)))
        uilpgr.minimumPressDuration = 2
        map.addGestureRecognizer(uilpgr)
        
        

        // Do any additional setup after loading the view, typically from a nib.
    }

    @objc func longpress(gestureRecognizer: UIGestureRecognizer) {
        
        var nameOfMark = ""
        
        if (gestureRecognizer.state == UIGestureRecognizerState.began) {
        
            let annotation = MKPointAnnotation()
            
            let touchpoint = gestureRecognizer.location(in: self.map)
            
            let coordinate = map.convert(touchpoint, toCoordinateFrom: self.map)
            
            let location = CLLocation(latitude: coordinate.latitude,longitude: coordinate.longitude)

            CLGeocoder().reverseGeocodeLocation(location, completionHandler: { (placemarks, error) in
                    
                if (error != nil) {
                        
                        print(error)
                        
                    } else {
                        
                        if let placemark = placemarks?[0] {
                            
                            if (placemark.subThoroughfare != nil) {
                                
                                nameOfMark += placemark.subThoroughfare! + " "
                                print(nameOfMark)
                                
                            }
                            
                            if (placemark.thoroughfare != nil) {
                                
                                nameOfMark += placemark.thoroughfare!
                                print(nameOfMark)
                            }
                            
                        }
                     
                        if (nameOfMark == "") {
                            
                            nameOfMark = "Added \(NSDate())"
                            

                        }
                    
                        annotation.title = nameOfMark
                        places.append(["name": nameOfMark, "lat": String(coordinate.latitude), "lon": String(coordinate.longitude)])
                    
                    }
                    
                })

            annotation.coordinate = coordinate
            
            map.addAnnotation(annotation)
            
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if (activePos != 0) {
        
            let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
            
            let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            
            let region = MKCoordinateRegionMake(location, span)
            
            self.map.setRegion(region, animated: true)
            
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}

