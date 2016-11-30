//
//  ViewController.swift
//  ParseDemo
//
//  Created by Aaron Bailey on 11/29/16.
//  Copyright © 2016 Aaron Bailey. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didTapSignup(_ sender: Any) {
    
        let user = PFUser()
        user.username = usernameField.text!
        user.password = passwordField.text!
        user.signUpInBackground { (success: Bool, error: Error?) in
            // code runs after signup atempt
            if error != nil {
                print(error?.localizedDescription ?? "")
                
            } else {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
                
                print("Yay, Signed up! all good in the hood!")
            }
        }
    }
    
    
    @IBAction func didTapLogin(_ sender: Any) {
        PFUser.logInWithUsername(inBackground: usernameField.text!, password: passwordField.text!) { (user: PFUser?, error: Error?) in
        // code that runs after trying to login
            if user == nil {
                print(error!.localizedDescription)
            } else {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
                print("All logged in!")
            }
        }
        
    
    
    }
    
    
    

}

