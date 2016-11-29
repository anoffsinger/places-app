//  HomeViewController.swift
//  MyPlaces
//
//  Created by Adam Noffsinger on 11/21/16.
//  Copyright © 2016 Adam Noffsinger. All rights reserved.

import UIKit

class HomeViewController: UIViewController, CardComposeViewControllerDelegate, UITableViewDataSource {
    
    @IBOutlet weak var menuIcon: UIButton!
    @IBOutlet weak var collectionTableView: UITableView!
    
    var collections = [Collection]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionTableView.dataSource = self
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
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "com.noff.CollectionCell", for: indexPath) as! CollectionTableViewCell
        
        cell.collectionLabel.text = collections[indexPath.row].name
        cell.collectionImageView.image = collections[indexPath.row].photo
        cell.numberPlacesLabel.text = String(collections[indexPath.row].numberPlaces)
        
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
}
