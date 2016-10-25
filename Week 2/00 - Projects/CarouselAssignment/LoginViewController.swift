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
    
    @IBOutlet weak var loginNavBar: UIImageView!
    @IBOutlet weak var fieldParentView: UIView!
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
    
    override func viewWillAppear(_ animated: Bool) {
        // Set initial transform values 20% of original size
        let transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
        // Apply the transform properties of the views
        loginNavBar.transform = transform
        fieldParentView.transform = transform
        // Set the alpha properties of the views to transparent
        loginNavBar.alpha = 0
        fieldParentView.alpha = 0
    }
    
    // The main view appeared...
    override func viewDidAppear(_ animated: Bool) {
        //Animate the code within over 0.3 seconds...
        UIView.animate(withDuration: 0.3) { () -> Void in
            // Return the views transform properties to their default states.
            self.fieldParentView.transform = CGAffineTransform.identity
            self.loginNavBar.transform = CGAffineTransform.identity
            // Set the alpha properties of the views to fully opaque
            self.fieldParentView.alpha = 1
            self.loginNavBar.alpha = 1
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
    
    func scrollViewDidScroll(_ scrollView: UIScrollView){
        if loginScrollView.contentOffset.y <= -25 {
            // Hide the keyboard
            view.endEditing(true)
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        // Move the buttons back down to it's original position
        buttonParentView.frame.origin.y = buttonInitialY
    }

    @IBAction func didPressBack(_ sender: AnyObject) {
        navigationController?.popToRootViewController(animated: true)

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
