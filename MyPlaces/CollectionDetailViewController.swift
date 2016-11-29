//
//  CollectionDetailViewController.swift
//  MyPlaces
//
//  Created by Adam Noffsinger on 11/17/16.
//  Copyright © 2016 Adam Noffsinger. All rights reserved.
//

import UIKit

class CollectionDetailViewController: UIViewController, UITableViewDataSource {
    

    
    @IBOutlet weak var collectionImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionLabelView: UILabel!
    
    var collection: Collection!
    var collectionTitle: String? = nil
    var collectionImage: UIImage? = nil
    
    let data = ["Starbelly"]
    
    override func viewWillAppear(_ animated: Bool) {
        collectionLabelView.text = collection.name
        collectionImageView.image = collection.photo
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.statusBarStyle = .lightContent
        tableView.dataSource = self
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
        cell.titleLabel.text = data[indexPath.row]
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
}
