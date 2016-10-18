//
//  CreateAccountViewController.swift
//  assignmentDropbox
//
//  Created by Aaron Bailey on 10/16/16.
//  Copyright © 2016 Aaron Bailey. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {

    @IBOutlet weak var passwordField: UITextField!
    
    let alertController = UIAlertController(title: nil, message: "Before you can complete your registration, you must accept the Dropbox Terms of Service", preferredStyle: .actionSheet)
    
    let agreeAction = UIAlertAction(title: "I Agree", style: .default) { (action) in
        //performSegue(withIdentifier: "toTerms", sender: self)
    }
    
    let termsAction = UIAlertAction(title: "View Terms", style: .default) { (action) in
        //performSegue(withIdentifier: toTerms, sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alertController.addAction(agreeAction)
        alertController.addAction(termsAction)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        navigationController!.popViewController(animated: true)
    }
    
    @IBAction func didTap(_ sender: AnyObject) {
        view.endEditing(true)
    }

    @IBAction func createButton(_ sender: UIButton) {
        present(alertController, animated: true) {
            // optional code for what happens after the alert controller has finished presenting
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
