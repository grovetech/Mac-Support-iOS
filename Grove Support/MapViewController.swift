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
        
        
        
        
        let mapcenter = CLLocationCoordinate2D(latitude: 47.116386,
                                              longitude: -101.299591)
        
        let location = CLLocationCoordinate2D(latitude: 38.903442,
                                              longitude: -77.0349633)
        
        let location2 = CLLocationCoordinate2D(latitude: 38.9091879,
                                              longitude: -77.0822474)
        
        let location3 = CLLocationCoordinate2D(latitude: 39.0402,
                                               longitude: -76.998328)
        
        let location4 = CLLocationCoordinate2D(latitude: 32.8327132,
                                               longitude: -83.6792745)
        
        let location5 = CLLocationCoordinate2D(latitude: 34.398582,
                                               longitude: -119.7849607)
        
        let location6 = CLLocationCoordinate2D(latitude:  32.5712265,
                                               longitude: -87.80447)
       
        let location7 = CLLocationCoordinate2D(latitude:  27.459647,
                                               longitude: -81.356423)
        
        let location8 = CLLocationCoordinate2D(latitude:  43.7182197,
                                               longitude: -79.4482688)
        
        let location9 = CLLocationCoordinate2D(latitude:  45.902399,
                                               longitude: -94.548914)
        
        
        // 2
        let span = MKCoordinateSpan(latitudeDelta: 30, longitudeDelta: 49)
        let region = MKCoordinateRegion(center: mapcenter, span: span)
        mapView.setRegion(region, animated: true)
        
        //3
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Grove Technologies"
        annotation.subtitle = "Nationwide Fully Remote & Distributed"
        mapView.addAnnotation(annotation)
        
        let annotation2 = MKPointAnnotation()
        annotation2.coordinate = location2
        annotation2.title = "Grove Technologies"
        annotation2.subtitle = "Nationwide Fully Remote & Distributed"
        mapView.addAnnotation(annotation2)
        
        let annotation3 = MKPointAnnotation()
        annotation3.coordinate = location3
        annotation3.title = "Grove Technologies"
        annotation3.subtitle = "Nationwide Fully Remote & Distributed"
        mapView.addAnnotation(annotation3)
        
        
        let annotation4 = MKPointAnnotation()
        annotation4.coordinate = location4
        annotation4.title = "Grove Technologies"
        annotation4.subtitle = "Nationwide Fully Remote & Distributed"
        mapView.addAnnotation(annotation4)
        
        let annotation5 = MKPointAnnotation()
        annotation5.coordinate = location5
        annotation5.title = "Grove Technologies"
        annotation5.subtitle = "Nationwide Fully Remote & Distributed"
        mapView.addAnnotation(annotation5)
        
        let annotation6 = MKPointAnnotation()
        annotation6.coordinate = location6
        annotation6.title = "Grove Technologies"
        annotation6.subtitle = "Nationwide Fully Remote & Distributed"
        mapView.addAnnotation(annotation6)
        
        
        let annotation7 = MKPointAnnotation()
        annotation7.coordinate = location7
        annotation7.title = "Grove Technologies"
        annotation7.subtitle = "Nationwide Fully Remote & Distributed"
        mapView.addAnnotation(annotation7)
        
        let annotation8 = MKPointAnnotation()
        annotation8.coordinate = location8
        annotation8.title = "Grove Technologies"
        annotation8.subtitle = "Nationwide Fully Remote & Distributed"
        mapView.addAnnotation(annotation8)
        
        let annotation9 = MKPointAnnotation()
        annotation9.coordinate = location9
        annotation9.title = "Grove Technologies"
        annotation9.subtitle = "Nationwide Fully Remote & Distributed"
        mapView.addAnnotation(annotation9)
        
        
        
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

