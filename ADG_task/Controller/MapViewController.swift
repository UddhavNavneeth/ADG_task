//
//  MapViewController.swift
//  ADG_task
//
//  Created by Sarvad shetty on 1/25/18.
//  Copyright © 2018 Sarvad shetty. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController ,MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    var restaurant:Restaurant!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        mapView.delegate = self
        
        
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(restaurant.location) { (placeMarks, error) in
            if error != nil{
                print(error!)
                return
            }
            if let placemarks = placeMarks{
                let placemark = placemarks[0]
                print("hi")
                print(placemark)
                
                let annotation = MKPointAnnotation()
                annotation.title = self.restaurant.name
                annotation.subtitle = self.restaurant.type
                
                if let location = placemark.location{
                    annotation.coordinate = location.coordinate
                    
                    self.mapView.showAnnotations([annotation], animated: true)
                    self.mapView.selectAnnotation(annotation, animated: true)
                }
            }
        }
    }
    
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        //
//    }


}
