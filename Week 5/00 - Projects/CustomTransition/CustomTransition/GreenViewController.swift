//
//  GreenViewController.swift
//  CustomTransition
//
//  Created by Aaron Bailey on 11/8/16.
//  Copyright © 2016 Aaron Bailey. All rights reserved.
//

import UIKit

class GreenViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    var text: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = text
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didTapDismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    } // End Tap Dismiss

}
