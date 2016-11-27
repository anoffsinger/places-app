//
//  ViewController.swift
//  MyPlaces
//
//  Created by Adam Noffsinger on 11/17/16.
//  Copyright © 2016 Adam Noffsinger. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var menuIcon: UIButton!
    
    @IBOutlet weak var collectionTitle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didPressMenuDown(_ sender: Any) {
        menuIcon.alpha = 0.3
    }
    
    @IBAction func releasedMenuIcon(_ sender: Any) {
        menuIcon.alpha = 1.0
    }
    

}

