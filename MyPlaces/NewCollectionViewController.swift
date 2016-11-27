//  NewCollectionViewController.swift
//  MyPlaces
//
//  Created by Adam Noffsinger on 11/17/16.
//  Copyright © 2016 Adam Noffsinger. All rights reserved.

import UIKit

// create a protocol for what happens when save button is tapped
protocol CardComposeViewControllerDelegate {
    func didTapSaveCollection(title: String, chosenImage: UIImage)
}

class NewCollectionViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    // variables
    @IBOutlet weak var collectionTitleLabel: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    let imagePicker = UIImagePickerController()
    var delegate: CardComposeViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionTitleLabel.becomeFirstResponder()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func didTapSave(_ sender: Any) {
        let title = collectionTitleLabel.text
        let chosenImage = imageView.image
        
        delegate.didTapSaveCollection(title: title!, chosenImage: chosenImage!)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didTapAddPhoto(_ sender: Any) {
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
