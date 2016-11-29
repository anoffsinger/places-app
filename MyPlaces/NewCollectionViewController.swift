//  NewCollectionViewController.swift
//  MyPlaces
//
//  Created by Adam Noffsinger on 11/17/16.
//  Copyright © 2016 Adam Noffsinger. All rights reserved.

import UIKit

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
        let name = collectionTitleLabel.text
        let photo = imageView.image
        let numberPlaces = 0
        
        // not sure what exclamations are doing here, need to figure out
        collection = Collection(name: name!, photo: photo!, numberPlaces: numberPlaces)
        
//        let title = collectionTitleLabel.text
//        let chosenImage = imageView.image
        
        delegate.didTapSaveCollection(collection: collection!)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didTapAddPhoto(_ sender: Any) {
//        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // set chosenImage to photo taken
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        
        imageView.image = chosenImage
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didPressClose(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
