//
//  LoginViewController.swift
//  MyPlaces
//
//  Created by Adam Noffsinger on 12/4/16.
//  Copyright © 2016 Adam Noffsinger. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapSignIn(_ sender: Any) {
        PFUser.logInWithUsername(inBackground: usernameField.text!, password: passwordField.text!) {
            (user: PFUser?, error: Error?) in
            if user == nil {
                print(error?.localizedDescription ?? "Something went wrong")
            } else {
                self.performSegue(withIdentifier: "EnterHomeScreenSegue", sender: nil)
            }
        }
    }

    
    @IBAction func didTapRegister(_ sender: Any) {
        
        let newUser = PFUser()
        
        newUser.username = usernameField.text
        newUser.password = passwordField.text
        
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if success {
                self.performSegue(withIdentifier: "EnterHomeScreenSegue", sender: nil)
            } else {
                print(error?.localizedDescription ?? "Something went wrong")
            }
        }
    }
}
