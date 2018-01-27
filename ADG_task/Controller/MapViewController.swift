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
        mapView.showsScale = true
        mapView.showsTraffic = true
        mapView.showsCompass = true
        
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "MyPin"
        
        //v this checks if we are looking at users current location if yes it will continuoue showig it the blue icon thts whil return nil
        if annotation.isKind(of: MKUserLocation.self){
            return nil
        }
        
        //it reuses annotation for better performance
        var annotationView : MKPinAnnotationView? = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView
        
        //this checks if there are previous annotation to reuse if not it will make one
        if annotationView == nil{
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
        }
        
        //adds images to left accessory view
            let leftIconView = UIImageView(frame: CGRect(x: 0, y: 0, width: 53, height: 53))
        leftIconView.image = UIImage(data: restaurant.image!)
        annotationView?.leftCalloutAccessoryView = leftIconView
        
        annotationView?.pinTintColor = UIColor.green
        return annotationView
    }


}
