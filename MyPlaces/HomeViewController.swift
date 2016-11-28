//  HomeViewController.swift
//  MyPlaces
//
//  Created by Adam Noffsinger on 11/21/16.
//  Copyright © 2016 Adam Noffsinger. All rights reserved.

import UIKit
// trying to build card class
//class CollectionCard: UIView {
//    
//    var collectionImage: UIImage!
//    var collectionTitle: UILabel!
//    
//    override init(frame: CGRect) {
//        
//        super.init(frame: frame)
//        self.backgroundColor = UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 1.0)
//        
//        collectionTitle = UILabel(frame: CGRect(x: 12, y: 8, width: 300, height: 50))
//        collectionTitle.text = "Whatever"
//        self.addSubview(collectionTitle)
//        
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}

class CaptionableImageView: UIView {
    var label: UILabel!
    var imageView: UIImageView!
    
    var caption: String? {
        get { return label?.text }
        set { label.text = newValue }
    }
    
    var image: UIImage? {
        get { return imageView.image }
        set { imageView.image = newValue }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    
    func initSubviews() {
        // sets the image's frame to fill our view
        imageView = UIImageView(frame: bounds)
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        addSubview(imageView)
        
        // caption has translucent grey background 30 points high and span across bottom of view
        let captionBackgroundView = UIView(frame: CGRect(x: 0, y: bounds.height - 30, width: bounds.width, height: 30))
        captionBackgroundView.backgroundColor = UIColor(white: 0.1, alpha: 0.8)
        addSubview(captionBackgroundView)
        
        label = UILabel(frame: CGRect(x: 0, y: bounds.height - 30, width: bounds.width, height: 30))
        label.textColor = UIColor(white: 0.9, alpha: 1.0)
        captionBackgroundView.addSubview(label)
    }
}

class HomeViewController: UIViewController, CardComposeViewControllerDelegate, UITableViewDataSource {
    
    @IBOutlet weak var menuIcon: UIButton!
    @IBOutlet weak var collectionTitle: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var newImage: UIImageView!
    @IBOutlet weak var collectionTableView: UITableView!
    
    let data = ["Oslo", "Amsterdam", "Bangalore", "Guangzhou"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize(width: self.view.frame.size.width, height: 1000)
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
    
    func didTapSaveCollection(title: String, chosenImage: UIImage) {
        collectionTitle.text = title
        newImage.image = chosenImage
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "com.noff.CollectionCell", for: indexPath) as! CollectionTableViewCell
        cell.collectionLabel.text = data[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        let currentSegue = segue.identifier
        
        if currentSegue == "ViewComposePageSegue" {
            let newCollectionViewController = segue.destination as! NewCollectionViewController
            newCollectionViewController.delegate = self
        }
    }
}
