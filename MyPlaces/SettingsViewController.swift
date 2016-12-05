//
//  SettingsViewController.swift
//  MyPlaces
//
//  Created by Adam Noffsinger on 11/17/16.
//  Copyright © 2016 Adam Noffsinger. All rights reserved.
//

import UIKit
import Parse

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func didPressClose(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func didPressSignOut(_ sender: Any) {
        PFUser.logOutInBackground { (error: Error?) in
            print(PFUser.current)
        }
        
        
    }
    
}
