//
//  AddPlaceViewController.swift
//  MyPlaces
//
//  Created by Adam Noffsinger on 11/30/16.
//  Copyright © 2016 Adam Noffsinger. All rights reserved.
//

import UIKit

class AddPlaceViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    let imagePicker = UIImagePickerController()
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    @IBAction func didTapAddPhoto(_ sender: Any) {
//        present(imagePicker, animated: true, completion: nil)
        showActionSheet()
        
    }
    
    @IBAction func didPressClose(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // set chosenImage to photo taken
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage

        imageView.image = chosenImage
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    func showActionSheet()  {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let cancelActionButton = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in
            print("Cancel")
        }
        
        actionSheet.addAction(cancelActionButton)
        
        let chooseFromCameraRoll = UIAlertAction(title: "Choose From Camera Roll", style: .default) { action -> Void in
            print("Choosing")
        }
        
        actionSheet.addAction(chooseFromCameraRoll)
        
        let takePhoto = UIAlertAction(title: "Take Photo", style: .default) { action -> Void in
            print("Photo'ing")
        }
        
        actionSheet.addAction(takePhoto)
        
        self.present(actionSheet, animated: true, completion: nil)
    }

}
