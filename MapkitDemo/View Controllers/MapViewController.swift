//
//  MapViewController.swift
//  MapkitDemo
//
//  Created by Weibin Wang on 2020-12-02.
//  Copyright © 2020 Weibin Wang. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit


class MapViewController: UIViewController, UITextFieldDelegate, MKMapViewDelegate {

    let locationManager = CLLocationManager()
    
    let initialLocation = CLLocation(latitude: 37.3230, longitude: -122.0322)
    
    @IBOutlet var myMapView : MKMapView!
    @IBOutlet var tbLocEntered : UITextField!
    @IBOutlet var myTableView : UITableView!
    
    var routeSteps = ["Enter a destination to see the steps"]
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
          return textField.resignFirstResponder()
      }

    let regionRadius : CLLocationDistance = 1000
    func centerMapOnLocation(location : CLLocation) {
        let coordinateRegion = MKCoordinateRegion.init(center: location.coordinate,
                                                  latitudinalMeters: regionRadius * 2.0, longitudinalMeters: regionRadius * 2.0)
        myMapView.setRegion(coordinateRegion, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        centerMapOnLocation(location: initialLocation)
        let dropPin = MKPointAnnotation()
        dropPin.coordinate = initialLocation.coordinate
        dropPin.title = "Starting at Apple headquarter"
        self.myMapView.addAnnotation(dropPin)
        self.myMapView.selectAnnotation(dropPin, animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
