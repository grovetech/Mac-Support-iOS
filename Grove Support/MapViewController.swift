//
//  SecondViewController.swift
//  Grove Support
//
//  Created by Jon on 6/10/19.
//  Copyright © 2019 Jon. All rights reserved.
//

import UIKit
import MapKit

extension UIViewController: MKMapViewDelegate {
    public func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation { return nil }
        
        let reuseIdentifier = "..."
        
        let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseIdentifier)
        
        if annotationView == nil {
            annotationView?.annotation = annotation
        } else {
            annotationView?.annotation = annotation
        }
        
        return annotationView
    }
}

class mapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mapView.delegate = self
        mapView.register(CustomAnnotationView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        
        let location = CLLocationCoordinate2D(latitude: 38.903442,
                                              longitude: -77.0349633)
        
        let location2 = CLLocationCoordinate2D(latitude: 38.9091879,
                                              longitude: -77.0822474)
        
        let location3 = CLLocationCoordinate2D(latitude: 39.0402,
                                               longitude: -76.998328)
        
        // 2
        let span = MKCoordinateSpan(latitudeDelta: 0.55, longitudeDelta: 0.55)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
        
        //3
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Grove Technologies"
        annotation.subtitle = "1030 15th St NW Suite 1050w, Washington, DC 20005"
        mapView.addAnnotation(annotation)
        
        let annotation2 = MKPointAnnotation()
        annotation2.coordinate = location2
        annotation2.title = "Grove Technologies"
        annotation2.subtitle = "Serving the DC, MD and VA Regions"
        mapView.addAnnotation(annotation2)
        
        let annotation3 = MKPointAnnotation()
        annotation3.coordinate = location3
        annotation3.title = "Grove Technologies"
        annotation3.subtitle = "Serving the DC, MD and VA Regions"
        mapView.addAnnotation(annotation3)
        
        let yourAnnotationAtIndex = 0
        mapView.selectAnnotation(mapView.annotations[yourAnnotationAtIndex], animated: true)
        
    }
    
    class CustomAnnotationView: MKPinAnnotationView {  // or nowadays, you might use MKMarkerAnnotationView
        override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
            super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
            
            canShowCallout = true
            rightCalloutAccessoryView = UIButton(type: .infoLight)
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        }
    }


}

