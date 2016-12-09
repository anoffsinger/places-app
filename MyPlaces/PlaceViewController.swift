//
//  PlaceViewController.swift
//  MyPlaces
//
//  Created by Adam Noffsinger on 11/30/16.
//  Copyright © 2016 Adam Noffsinger. All rights reserved.
//

import UIKit
import MapKit



class PlaceViewController: UIViewController, UIScrollViewDelegate, MKMapViewDelegate, CLLocationManagerDelegate {

    var place: Place!
    var locationManager : CLLocationManager!
    
    @IBOutlet weak var placeTitle: UILabel!
    @IBOutlet weak var placeDescription: UILabel!
    @IBOutlet weak var placeTags: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var placePhoto: UIImageView!
    @IBOutlet weak var placeAddress: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var tags: UIView!
    @IBOutlet weak var address: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    let standardLabelFontStyle = UIFont.systemFont(ofSize: 14.0, weight: UIFontWeightRegular)
    
    override func viewWillAppear(_ animated: Bool) {
        scrollView.delegate = self
        
        placeTitle.text = place.name
        placeDescription.text = place.description
        placeTags.text = place.tags
        placePhoto.image = place.photo
        placeDescription.sizeToFit()
        placeAddress.text = "\(place.latitude), \(place.longitude)"
        
        let descriptionBottom = placeDescription.frame.maxY
        tags.frame.origin.y = descriptionBottom + 22
        
        let tagsBottom = tags.frame.maxY
        mapView.frame.origin.y = tagsBottom + 20
        
        let mapBottom = mapView.frame.maxY
        address.frame.origin.y = mapBottom + 4
        
        scrollView.contentSize = CGSize(width: 375, height: address.frame.maxY + 140)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        locationManager = CLLocationManager()
//        locationManager.delegate = self
        
        mapView.delegate = self
        mapView.setRegion(MKCoordinateRegionMake(CLLocationCoordinate2DMake(place.latitude, place.longitude), MKCoordinateSpanMake(0.001, 0.001)), animated: false)
        addPin()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func didPressBack(_ sender: Any) {
        navigationController!.popViewController(animated: true)
    }

    func addPin() {
        let annotation = MKPointAnnotation()
        let locationCoordinate = CLLocationCoordinate2DMake(place.latitude, place.longitude)
        annotation.coordinate = locationCoordinate
        mapView.addAnnotation(annotation)
    }
    
    func mapView( _ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let reuseID = "myAnnotationView"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseID)
        if (annotationView == nil) {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseID)
        }
        
        annotationView?.image = UIImage(named: "pin.png")
        print("working")
        return annotationView
        
        
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        openMapForPlace()
    }
    
    func openMapForPlace() {
        
        let latitude:CLLocationDegrees =  place.latitude
        let longitude:CLLocationDegrees =  place.longitude
        
        let regionDistance:CLLocationDistance = 10000
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegionMakeWithDistance(coordinates, regionDistance, regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = place.name
        mapItem.openInMaps(launchOptions: options)
    }
    
}
