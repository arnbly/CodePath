//
//  SignInViewController.swift
//  Tumblr
//
//  Created by Aaron Bailey on 11/7/16.
//  Copyright © 2016 Aaron Bailey. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.becomeFirstResponder()
    }

    @IBAction func didPressCancel(_ sender: Any) {
        view.endEditing(true)
        dismiss(animated: true, completion: nil)
    }
}
