//
//  PlaceViewController.swift
//  MyPlaces
//
//  Created by Adam Noffsinger on 11/30/16.
//  Copyright © 2016 Adam Noffsinger. All rights reserved.
//

import UIKit
import MapKit



class PlaceViewController: UIViewController, UIScrollViewDelegate {

    var place: Place!
    
    
    @IBOutlet weak var placeTitle: UILabel!
    @IBOutlet weak var placeDescription: UILabel!
    @IBOutlet weak var placeTags: UILabel!
    
    @IBOutlet weak var placePhoto: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        placeTitle.text = place.name
        placeDescription.text = place.description
        placeTags.text = place.tags
        placePhoto.image = place.photo
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func didPressBack(_ sender: Any) {
        navigationController!.popViewController(animated: true)
    }
    
}
