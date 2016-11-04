//
//  ViewController.swift
//  YouTube
//
//  Created by Aaron Bailey on 11/3/16.
//  Copyright © 2016 Aaron Bailey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var feedView: UIView!
    
    var menuViewController: UIViewController!
    var feedViewController: UIViewController!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        menuViewController = main.instantiateViewController(withIdentifier: "MenuViewController")
        menuView.addSubview(menuViewController.view)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didPanFeed(_ sender: UIPanGestureRecognizer) {
        
        
    }

}

