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
    
    
    @IBOutlet weak var placeTitle: UILabel!
    @IBOutlet weak var placeDescription: UILabel!
    @IBOutlet weak var placeTags: UILabel!
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var placePhoto: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var tags: UIView!
    
    let standardLabelFontStyle = UIFont.systemFont(ofSize: 14.0, weight: UIFontWeightRegular)
    
    override func viewWillAppear(_ animated: Bool) {
        placeTitle.text = place.name
        placeDescription.text = place.description
        placeTags.text = place.tags
        placePhoto.image = place.photo
        placeDescription.sizeToFit()
        
        let descriptionBottom = placeDescription.frame.maxY
        tags.frame.origin.y = descriptionBottom + 10
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        
        // set this to the coordinate from class
        mapView.setRegion(MKCoordinateRegionMake(CLLocationCoordinate2DMake(37.783333, -122.416667), MKCoordinateSpanMake(0.1, 0.1)), animated: true)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func didPressBack(_ sender: Any) {
        navigationController!.popViewController(animated: true)
    }
    
}
