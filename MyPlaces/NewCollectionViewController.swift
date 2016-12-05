//  NewCollectionViewController.swift
//  MyPlaces
//
//  Created by Adam Noffsinger on 11/17/16.
//  Copyright © 2016 Adam Noffsinger. All rights reserved.

import UIKit
import Parse

// create a protocol for what happens when save button is tapped
protocol CardComposeViewControllerDelegate {
    func didTapSaveCollection(collection: Collection)
}

class NewCollectionViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    // variables
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var collectionTitleLabel: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    let imagePicker = UIImagePickerController()
    var delegate: CardComposeViewControllerDelegate!
    
    // State that there may be an instance of a new collection, question mark shows it could be nil
    var collection: Collection?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionTitleLabel.becomeFirstResponder()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imageView.clipsToBounds = true
//        saveButton.isEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func didTapSave(_ sender: Any) {
        var tempName: String
        if let name = collectionTitleLabel.text {
            tempName = name
        } else {
            tempName = "untitled"
        }
        let photo = imageView.image
        let numberPlaces = 0
        
        // not sure what exclamations are doing here, need to figure out
        collection = Collection(name: tempName, photo: photo, numberPlaces: numberPlaces)
        
        delegate.didTapSaveCollection(collection: collection!)
        
//        var myCollection = PFObject(className:"Collection")
//        myCollection["name"] = collectionTitleLabel.text
//        
//        myCollection["numberPlaces"] = 0
//        myCollection.saveInBackground {
//            (success: Bool, error: Error?) -> Void in
//            if success {
//                print("uploaded")
//            } else {
//                print("whoops")
//            }
//        }
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didTapAddPhoto(_ sender: Any) {
        showActionSheet()
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
}
