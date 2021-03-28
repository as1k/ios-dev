//
//  ViewController.swift
//  CoreDataMap
//
//  Created by Асыланбек Нурмухамбет on 3/27/21.
//  Copyright © 2021 kbtu.edu.as1k.kz. All rights reserved.
//

import UIKit
import MapKit
import CoreData

var places: [Place] = []

class ViewController: UIViewController, MKMapViewDelegate {
    var annotationId = 0
    var mapType:[Int: MKMapType] = [0: .hybrid, 1: .standard, 2: .satellite]
    
    @IBOutlet weak var myMap: MKMapView!
    @IBAction func previousClicked(_ sender: UIButton) {
        if (annotationId == 0) {
            annotationId = places.count
        }
        for annotation in self.myMap.annotations {
            if let title = annotation.title, title == places[annotationId - 1].name {
                if let subtitle = annotation.subtitle, subtitle == places[annotationId - 1].desc {
                    self.myMap.showAnnotations([annotation], animated: true)
                    self.title = annotation.title!
                }
            }
        }
        annotationId = annotationId - 1
    }
    
    @IBAction func nextClicked(_ sender: UIButton) {
        if (annotationId == places.count - 1) {
            annotationId = -1
        }
        for annotation in self.myMap.annotations {
            if let title = annotation.title, title == places[annotationId + 1].name {
                if let subtitle = annotation.subtitle, subtitle == places[annotationId + 1].desc {
                    self.myMap.showAnnotations([annotation], animated: true)
                    self.title = annotation.title!
                }
            }
        }
        annotationId = annotationId + 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myMap.mapType = .standard
        myMap.delegate = self
        initMap()
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is MKPointAnnotation else { return nil }
        
        let identifier = "Annotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView!.canShowCallout = true
            let rightButton = UIButton(type: .detailDisclosure)
            annotationView!.rightCalloutAccessoryView = rightButton
            
        } else {
            annotationView!.annotation = annotation
        }
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if control == view.rightCalloutAccessoryView {
            self.performSegue(withIdentifier: "editSegue", sender: view)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "editSegue" )
        {
            let destination = segue.destination as! EditViewController
            destination.name = (sender as! MKAnnotationView).annotation!.title!
            destination.desc = (sender as! MKAnnotationView).annotation!.subtitle!
            destination.updateDelegate = self
            
        }
        else if segue.identifier == "placesListSegue"
        {
            let destination = segue.destination as! PlacesTableViewController
            destination.deleteDelegate = self
            destination.switchAnnotationDelegate = self
        }
    }
    
    @IBAction func segmentSelected(_ sender: UISegmentedControl) {
        myMap.mapType = mapType[sender.selectedSegmentIndex] ?? .standard
    }
    
    @IBAction func longTap(_ sender: UILongPressGestureRecognizer) {
        
        let touchPoint = sender.location(in: self.myMap)
        let coordinate = self.myMap.convert(touchPoint, toCoordinateFrom: self.myMap)
        
        let alertController = UIAlertController(
            title: "New location",
            message: "Fill the fields",
            preferredStyle: .alert
        )
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Location"
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "Description"
        }
        let save =  UIAlertAction(title: "OK", style: .default){ [weak self] (alert) in
            let firstTextField = alertController.textFields![0] as UITextField
            let secondTextField = alertController.textFields![1] as UITextField
            
            let annotation = MKPointAnnotation()
            annotation.title = firstTextField.text
            annotation.subtitle = secondTextField.text
            annotation.coordinate = coordinate
            
            self?.myMap.addAnnotation(annotation)
            self?.savePlace(firstTextField.text!, secondTextField.text!, coordinate)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alertController.addAction(save)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func initMap() {
        initPlaces()
        for place in places {
            let annotation = MKPointAnnotation()
            annotation.title = place.name
            annotation.subtitle = place.desc
            annotation.coordinate = CLLocationCoordinate2D(latitude: place.latitude,longitude:place.longitude)
            self.myMap.addAnnotation(annotation)
        }
        self.myMap.showAnnotations(self.myMap.annotations, animated: true)
    }
    
    func savePlace(_ name: String, _ description: String, _ coordinate: CLLocationCoordinate2D) {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            let context = appDelegate.persistentContainer.viewContext
            if let entity = NSEntityDescription.entity(forEntityName:"Place", in: context)
            {
                let place =  NSManagedObject(entity: entity,insertInto:context)
                place.setValue (name, forKey:"name")
                place.setValue (description, forKey:"desc")
                let longtitude = coordinate.longitude
                let latitude = coordinate.latitude
                place.setValue (longtitude, forKey:"longitude")
                place.setValue (latitude, forKey:"latitude")
                
                do{
                    try context.save()
                    places.append(place as! Place)
                }
                catch{print("Error")}
            }
        }
    }
}

extension ViewController : DeleteDelegate, UpdateDelegate, SwitchAnnotation {
    
    func switchOpenedAnnotation(_ name: String, _ descrip: String) {
        for annotation in self.myMap.annotations {
            if let title = annotation.title, title == name {
                if let subtitle = annotation.subtitle, subtitle == descrip{
                    self.myMap.showAnnotations([annotation], animated: true)
                    self.title = annotation.title!
                    
                }
            }
        }
    }
    
    func updatePlace() {
        self.myMap.removeAnnotations(self.myMap.annotations)
        initMap()
    }
    
    func deletePlace(_ name: String, _ descrip: String) {
        for annotation in self.myMap.annotations {
            if let title = annotation.title, title == name {
                if let subtitle = annotation.subtitle, subtitle == descrip{
                    self.myMap.removeAnnotation(annotation)
                }
            }
        }
    }
}

func initPlaces() {
    if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<Place>(entityName: "Place")
        do {
            try places = context.fetch(fetchRequest)
        } catch {}
    }
}
