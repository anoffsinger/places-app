//  AddPlaceViewController.swift
//  MyPlaces
//
//  Created by Adam Noffsinger on 11/30/16.
//  Copyright © 2016 Adam Noffsinger. All rights reserved.

import UIKit
import MapKit
import CoreLocation

protocol PlaceComposeViewControllerDelegate {
    func didTapSavePlace(place: Place)
}

class AddPlaceViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, MKMapViewDelegate, CLLocationManagerDelegate, UITextViewDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var placeTitleField: UITextField!
    @IBOutlet weak var placeDescriptionField: UITextView!
    @IBOutlet weak var placeTagsField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var mapView: MKMapView!

    var coordinates : CLLocationCoordinate2D!
    var locationManager : CLLocationManager!
    var delegate: PlaceComposeViewControllerDelegate!
    var place: Place?
    
    let mediumGrey = UIColor(red:0.75, green:0.75, blue:0.75, alpha:1.0)
    let charcoal = UIColor(red:0.27, green:0.27, blue:0.27, alpha:1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 4.0
        
        mapView.delegate = self
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.distanceFilter = 200
        locationManager.requestWhenInUseAuthorization()
        
        placeDescriptionField.delegate = self
        placeDescriptionField.textColor = mediumGrey
        placeDescriptionField.text = "Add a description"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if placeDescriptionField.textColor == mediumGrey {
            placeDescriptionField.text = nil
            placeDescriptionField.textColor = charcoal
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if placeDescriptionField.text.isEmpty {
            placeDescriptionField.text = "Add a description"
            placeDescriptionField.textColor = mediumGrey
        }
    }
    
    @IBAction func didTapAddPhoto(_ sender: Any) {
        showActionSheet()
    }
    
    @IBAction func didTapSave(_ sender: Any) {
        let name = placeTitleField.text
        let photo = imageView.image
        let description = placeDescriptionField.text
        let tags = placeTagsField.text
        
        // not sure what exclamations are doing here, need to figure out
        place = Place(name: name!, photo: photo!, tags: tags!, description: description!)
        
        delegate.didTapSavePlace(place: place!)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didPressClose(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // set chosenImage to photo taken
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage

        imageView.image = chosenImage
        self.dismiss(animated: true, completion: nil)
    }
    
    func showActionSheet() {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let cancelActionButton = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in
            print("Cancel")
        }
        
        actionSheet.addAction(cancelActionButton)
        
        let chooseFromCameraRoll = UIAlertAction(title: "Choose From Camera Roll", style: .default) { action -> Void in
            self.photoLibrary()
        }
        
        actionSheet.addAction(chooseFromCameraRoll)
        
        let takePhoto = UIAlertAction(title: "Take Photo", style: .default) { action -> Void in
            self.camera()
        }
        
        actionSheet.addAction(takePhoto)
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    func camera() {
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self;
        myPickerController.sourceType = .camera
        
        self.present(myPickerController, animated: true, completion: nil)
    }
    
    func photoLibrary() {
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self;
        myPickerController.sourceType = .photoLibrary
        
        self.present(myPickerController, animated: true, completion: nil)
    }
    
    // center on user's location
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        let annotations = [mapView.userLocation]
        mapView.showAnnotations(annotations, animated: true)
    }
    
    // start getting user's location
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == CLAuthorizationStatus.authorizedWhenInUse {
            manager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.first
        coordinates = location?.coordinate
        
        print(coordinates)
    }
}
