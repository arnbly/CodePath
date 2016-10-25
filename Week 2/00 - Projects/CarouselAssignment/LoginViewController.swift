//
//  LoginViewController.swift
//  CarouselAssignment
//
//  Created by Aaron Bailey on 10/24/16.
//  Copyright © 2016 Aaron Bailey. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var loginScrollView: UIScrollView!
    
    @IBOutlet weak var buttonParentView: UIView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Scrollview Init
        loginScrollView.delegate = self
        loginScrollView.contentSize = loginScrollView.frame.size
        loginScrollView.contentInset.bottom = 100
        
        //Button Offset Init
        buttonInitialY = buttonParentView.frame.origin.y
        buttonOffset = -120
        
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillShow, object: nil, queue: OperationQueue.main) { (notification: Notification) in
            
            self.buttonParentView.frame.origin.y = self.buttonInitialY + self.buttonOffset
            
            self.loginScrollView.contentOffset.y = self.loginScrollView.contentInset.bottom
        }
        
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillHide, object: nil, queue: OperationQueue.main) { (notification: Notification) in
            // Any code you put in here will be called when the keyboard is about to hide
        }


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func didPressSignIn(_ sender: UIButton) {
        
        //Check if fields are empty
        if emailField.text!.isEmpty || passwordField.text!.isEmpty {
            
            //Init Alert Controller
            let alertController = UIAlertController(title: "Email Required", message: "Please Enter Your Email Address", preferredStyle: .alert)
            
            //Create Buttons for Alert Controller
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
            }
            //Attach Buttons to Alert Controller
            alertController.addAction(OKAction)
            
            //Display Alert Controller
            present(alertController, animated: true) {
            }
        //If Fields not empty check correct credentials
        } else {
            activityIndicator.startAnimating()
            
            //Faux server call
            delay(2, closure: {
                self.activityIndicator.stopAnimating()
                
                //Validate Creds
                if self.emailField.text == "email" && self.passwordField.text == "password" {
                    
                    //Perform Segue 
                    self.performSegue(withIdentifier: "signInSegue", sender: nil)
                }
                //If Creds Incorrect display alert
                else {
                    
                    //Init Alert Controller
                    let alertController = UIAlertController(title: "Incorrect Email or Password", message: "Please Enter A Valid Email or Password", preferredStyle: .alert)
                    
                    //Create Buttons for Alert Controller
                    let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                    }
                    
                    //Add Buttons to Alert Controller
                    alertController.addAction(OKAction)
                    
                    //Show Alert Controller
                    self.present(alertController, animated: true) {
                    }
                }
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
