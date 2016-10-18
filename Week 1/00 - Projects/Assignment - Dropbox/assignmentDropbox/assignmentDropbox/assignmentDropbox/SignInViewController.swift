//
//  SignInViewController.swift
//  assignmentDropbox
//
//  Created by Aaron Bailey on 10/16/16.
//  Copyright © 2016 Aaron Bailey. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signInButton.isEnabled = true

        passwordField.isSecureTextEntry = true
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backBtn(_ sender: UIButton) {
        navigationController!.popViewController(animated: true)
    }
    
    /*@IBAction func didTap(_ sender: AnyObject) {
        view.endEditing(true)
    }*/


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
