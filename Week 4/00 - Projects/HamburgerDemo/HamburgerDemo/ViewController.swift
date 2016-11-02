//
//  ViewController.swift
//  HamburgerDemo
//
//  Created by Aaron Bailey on 11/1/16.
//  Copyright © 2016 Aaron Bailey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backContainerView: UIView!
    @IBOutlet weak var frontContainerView: UIView!
    
    var main = UIStoryboard(name: "Main", bundle: nil)
    var greenView: UIView!
    var redView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let greenViewController = main.instantiateViewController(withIdentifier: "GreenViewController")
        let redViewController = main.instantiateViewController(withIdentifier: "RedViewController")
        
        greenViewController.view.frame = backContainerView.bounds
        redViewController.view.frame = backContainerView.bounds
        
        backContainerView.addSubview(redViewController.view)
        frontContainerView.addSubview(greenViewController.view)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didPanTopView(_ sender: AnyObject) {
        
        let translation = sender.translation(in: view)
        
        frontContainerView.transform = frontContainerView.transform.translatedBy(x: translation.x, y: 0)
        
        sender.setTranslation(CGPoint.zero, in: view)
        
    }

}

