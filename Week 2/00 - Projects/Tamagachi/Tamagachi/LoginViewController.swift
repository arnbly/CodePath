//
//  LoginViewController.swift
//  Tamagachi
//
//  Created by Aaron Bailey on 10/18/16.
//  Copyright © 2016 Aaron Bailey. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()                                                                                                                                                                                                                                         

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressLogin(_ sender: UIButton) {
        activityIndicator.startAnimating()
        
        if emailField.text == "email" && passwordField.text == "password" {
            
            delay(0.8, closure: { 
                self.activityIndicator.stopAnimating()
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            })
        } else {
            delay(0.8, closure: {
                self.activityIndicator.stopAnimating()
                let alertController = UIAlertController(title: "Incorrect Login", message: "Your username or password is incorrect", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: { (UIAlertAction) in
                    print("Ok Pressed")
                })
                alertController.addAction(okAction)
                self.present(alertController, animated: true, completion: nil)
                
            })
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
