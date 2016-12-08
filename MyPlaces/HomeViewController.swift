//  HomeViewController.swift
//  MyPlaces
//
//  Created by Adam Noffsinger on 11/21/16.
//  Copyright © 2016 Adam Noffsinger. All rights reserved.

import UIKit
import Parse

class HomeViewController: UIViewController, CardComposeViewControllerDelegate, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var menuIcon: UIButton!
    @IBOutlet weak var collectionTableView: UITableView!
    @IBOutlet weak var emptyStateView: UIView!
    
    var collections = [Collection]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionTableView.dataSource = self
        collectionTableView.delegate = self
        if collections.count == 0 {
            emptyStateView.alpha = 1
        } else {
            emptyStateView.alpha = 0
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func didPressMenuDown(_ sender: Any) {
        menuIcon.alpha = 0.3
    }
    
    @IBAction func releasedMenuIcon(_ sender: Any) {
        menuIcon.alpha = 1.0
    }
    
    func didTapSaveCollection(collection: Collection) {
        let newIndexPath = IndexPath(row: collections.count, section: 0)
        collections.append(collection)
        collectionTableView.insertRows(at: [newIndexPath], with: .bottom)
        
        if collections.count == 0 {
            emptyStateView.alpha = 1
        } else {
            emptyStateView.alpha = 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "com.noff.CollectionCell", for: indexPath) as! CollectionTableViewCell
        let greyscaleImage = convertToGrayScale(image: collections[indexPath.row].photo!)
        cell.collectionImageView.image = greyscaleImage
        
        cell.collectionLabel.text = collections[indexPath.row].name
        
//        cell.collectionImageView.image = collections[indexPath.row].photo!
        if collections[indexPath.row].numberPlaces == 0 {
            cell.numberPlacesLabel.text = "Tap to add a place"
        } else {
            cell.numberPlacesLabel.text = "\(collections[indexPath.row].numberPlaces) places"
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collections.count
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        
        let currentSegue = segue.identifier
        let collectionDetailViewController: CollectionDetailViewController!
        
        if currentSegue == "ViewComposePageSegue" {
            
            let newCollectionViewController = segue.destination as! NewCollectionViewController
            newCollectionViewController.delegate = self
        
        } else if currentSegue == "ViewCollectionDetailSegue"{
            
            collectionDetailViewController = segue.destination as! CollectionDetailViewController
            
            if let selectedCollectionTableViewCell = sender as? CollectionTableViewCell {
                let indexPath = collectionTableView.indexPath(for: selectedCollectionTableViewCell)!
                let selectedCollection = collections[indexPath.row]
                collectionDetailViewController.collection = selectedCollection
            }
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("scrolling")
    }
    
    // cifilter? or gpuimage library
    
    func convertToGrayScale(image: UIImage) -> UIImage {
        
        print(image.imageOrientation.rawValue)
        // creates image rectangle
        let imageRect = CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height)
        
        // creates device dependent greyscale colorspace
        let colorSpace = CGColorSpaceCreateDeviceGray()
        
        // gets sizes of original image
        let width = image.size.width
        let height = image.size.height
        
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.none.rawValue)
        let context = CGContext(data: nil, width: Int(width), height: Int(height), bitsPerComponent: 8, bytesPerRow: 0, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)
        context?.draw(image.cgImage!, in: imageRect)
        let imageRef = context!.makeImage()
        let newImage = UIImage(cgImage: imageRef!, scale: image.scale, orientation: image.imageOrientation)
        
        return newImage
    }
}
