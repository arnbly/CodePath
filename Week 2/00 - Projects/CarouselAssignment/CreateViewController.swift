//
//  CreateViewController.swift
//  CarouselAssignment
//
//  Created by Aaron Bailey on 10/24/16.
//  Copyright © 2016 Aaron Bailey. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var createScrollView: UIScrollView!
    @IBOutlet weak var buttonParentView: UIView!
    @IBOutlet weak var checkBoxButton: UIButton!
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passField: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Scrollview Init
        createScrollView.delegate = self
        createScrollView.contentSize = createScrollView.frame.size
        createScrollView.contentInset.bottom = 100
        
        //Button Offset Init
        buttonInitialY = buttonParentView.frame.origin.y
        buttonOffset = -120

        //Shift view on keyboard show
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillShow, object: nil, queue: OperationQueue.main) { (notification: Notification) in
            
            self.buttonParentView.frame.origin.y = self.buttonInitialY + self.buttonOffset
            
            self.createScrollView.contentOffset.y = self.createScrollView.contentInset.bottom
        }
        
    }

    @IBAction func didPressCreate(_ sender: UIButton) {
        
        //Check if fields are empty
        if emailField.text!.isEmpty || passField.text!.isEmpty  {
            
            //Init Alert Controller
            let alertController = UIAlertController(title: "Email and Password Required", message: "Please Enter Your Email Address and Password", preferredStyle: .alert)
            
            //Create Buttons for Alert Controller
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
            }
            //Attach Buttons to Alert Controller
            alertController.addAction(OKAction)
            
            //Display Alert Controller
            present(alertController, animated: true) {
            }
        } else if checkBoxButton.isSelected == false {
            //Init Alert Controller
            let alertController = UIAlertController(title: "Please Agree to Terms to Continue", message: "Please agree to the terms and conditions to finish creating your account.", preferredStyle: .alert)
            
            //Create Buttons for Alert Controller
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
            }
            //Attach Buttons to Alert Controller
            alertController.addAction(OKAction)
            
            //Display Alert Controller
            present(alertController, animated: true) {
            }
        
        }
        else {
            activityIndicator.startAnimating()
            
            //Faux server call
            delay(2, closure: {
                self.activityIndicator.stopAnimating()

                    //Perform Segue
                    self.performSegue(withIdentifier: "createAcctSegue", sender: nil)
            })
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func didPressBack(_ sender: AnyObject) {
        navigationController?.popToRootViewController(animated: true)

    }
    
    @IBAction func termsSelected(_ sender: UIButton) {
        
        checkBoxButton.isSelected = !checkBoxButton.isSelected

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
