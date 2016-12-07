//
//  CollectionDetailViewController.swift
//  MyPlaces
//
//  Created by Adam Noffsinger on 11/17/16.
//  Copyright © 2016 Adam Noffsinger. All rights reserved.
//

import UIKit

class CollectionDetailViewController: UIViewController, UITableViewDataSource, PlaceComposeViewControllerDelegate, UIScrollViewDelegate {
    
    @IBOutlet weak var collectionImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionLabelView: UILabel!
    @IBOutlet weak var addPlaceButton: UIButton!
    
    @IBOutlet weak var buttonShadowView: UIView!
    
    var collection: Collection!
    var collectionTitle: String? = nil
    var collectionImage: UIImage? = nil
    
    var places = [Place]()
    
    override func viewWillAppear(_ animated: Bool) {
        collectionLabelView.text = collection.name
        collectionImageView.image = collection.photo
        
        buttonShadowView.layer.cornerRadius = 0.5 * buttonShadowView.bounds.size.width
        buttonShadowView.layer.shadowColor = UIColor.black.cgColor
        buttonShadowView.layer.shadowOffset = CGSize(width: 0, height: 10)
        buttonShadowView.layer.shadowOpacity = 0.07
        buttonShadowView.layer.shadowRadius = 10
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.statusBarStyle = .lightContent
        tableView.dataSource = self
        addPlaceButton.layer.cornerRadius = 0.5 * addPlaceButton.bounds.size.width
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func didPressBack(_ sender: Any) {
        navigationController!.popViewController(animated: true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.default
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "com.noff.PlaceCell", for: indexPath) as! TableViewCell
        cell.titleLabel.text = places[indexPath.row].name
        cell.tagsLabel.text = places[indexPath.row].tags
        cell.accessoryType = UITableViewCellAccessoryType.none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    func didTapSavePlace(place: Place) {
        let newIndexPath = IndexPath(row: places.count, section: 0)
        places.append(place)
        tableView.insertRows(at: [newIndexPath], with: .bottom)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let currentSegue = segue.identifier
        let placeViewController: PlaceViewController!
        
        if currentSegue == "AddPlaceSegue" {
            
            let addPlaceViewController = segue.destination as! AddPlaceViewController
            addPlaceViewController.delegate = self
        
        } else if currentSegue == "ViewPlaceSegue" {
           
            placeViewController = segue.destination as! PlaceViewController
            
            if let selectedPlaceTableViewCell = sender as? TableViewCell {
                let indexPath = tableView.indexPath(for: selectedPlaceTableViewCell)!
                let selectedPlace = places[indexPath.row]
                placeViewController.place = selectedPlace
                tableView.deselectRow(at: indexPath, animated: true)
            }
        }
    }
}
